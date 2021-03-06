-module(cache_server_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.
start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", cache_server, []}]}
    ]),
    cowboy:start_http(my_http_listener, 100, [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]),
    cache_server_sup:start_link().

stop(_State) ->
	ok.
