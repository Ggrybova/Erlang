-module(server_cache_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	server_cache_sup:start_link().

stop(_State) ->
	ok.
