-module(cache_server).
-behaviour(gen_server).

%% API.
-export([start_link/1]).
-export([insert/3]).
-export([check_time/1]).
-export([lookup/1]).
%-export([lookup_by_date/2]).
-export([delete/1]).
-export([delete_obsolete/0]).
-export([table_print/0]).
-export([stop/0]).

-define(TABLE, cache_tab).

%% gen_server.
-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).
-export([handle_info/2]).
-export([terminate/2]).
-export([code_change/3]).

-record(state, {drop_int :: integer()}).

%% API.

-spec start_link(Arg :: any()) -> {ok, pid()}.
start_link(Arg) ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, Arg, []).

-spec insert(Key :: any(), Value :: any(), Limit :: integer()) -> ok.
insert(Key, Value, Limit) -> 
	ets:insert(?TABLE, {Key, Value, os:timestamp(), Limit, date(), time()}),
	ok.

check_time(Key) ->
	[[Lim]] = ets:match(?TABLE, {Key, '_', '_', '$4', '_', '_'}),
	[[A1]] = ets:match(?TABLE, {Key, '_', '$3', '_', '_', '_'}),
	A = element(2, A1),
	B = element(2, os:timestamp()),
	C = B -A,
	if
		C < Lim -> 1;
		C >= Lim -> 0
	end.

-spec lookup(Key :: any()) -> {ok, Value :: any()} | [].
lookup(Key) -> 
	Match = ets:match(?TABLE, {Key, '$2', '_', '_','_','_'}),
	case Match of
		[] -> [];
		_ ->
		[[Val]] = Match,
		case check_time(Key) of
			1 -> {ok, Val};
			0 -> []
		end
	end.

%lookup_by_date() -> .

delete(Key) ->
	ets:delete(?TABLE, Key).

delete_obsolete() ->
	Elem = ets:first(?TABLE),
	receive
		{From, Interval} when Elem /= '$end_of_table' ->
			delete_obsolete(Elem);
		stop ->
			true
	end.

delete_obsolete(Id) ->
	Next = ets:next(?TABLE, Id),
	case lookup(Id) of
		[] -> delete(Id);
		_ -> ok
	end,
	case Next of
		'$end_of_table' -> ok;
		_ -> delete_obsolete(Next)
	end.

table_print() ->
	ets:tab2list(?TABLE).

stop() ->
	gen_server:stop(?MODULE).

%% gen_server.

init([{drop_interval, Interval}]) ->
	ets:new(?TABLE, [named_table, public]),
	{ok, #state{drop_int = Interval}}.

handle_call(_Request, _From, State) ->
	{reply, ignored, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_info(_Info, State) ->
	{noreply, State}.

terminate(_Reason, _State) ->
	ets:delete(?TABLE),
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.
