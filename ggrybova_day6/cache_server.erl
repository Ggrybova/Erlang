-module(cache_server).
-behaviour(gen_server).

-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).
-export([handle_info/2]).
-export([terminate/2]).
-export([code_change/3]).

-record(server, {pid, drop_int}).

init(Interval) ->
	{ok, #server{pid => cache_server,
				drop_int => Interval}}.

handle_call() ->
.

handle_cast() ->
.

handle_info() ->
.

terminate() ->
.

code_change() ->
.