-module(cache_server).
-behaviour(gen_server).

-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).
-export([handle_info/2]).
-export([terminate/2]).
-export([code_change/3]).

-record(state, {drop_int :: int()}).

init({_Arg, Interval}) ->
	State = #state{drop_int => Interval},
	ets:new(?TAB_NAME, [named_table]),
	{ok, State}.

handle_call() ->
.

handle_cast() ->
.

handle_info() ->
.

terminate(Reason, State) ->
	ets:delete(?TAB_NAME),
	ok.

code_change() ->
.