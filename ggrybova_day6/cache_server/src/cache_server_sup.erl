-module(cache_server_sup).
-behaviour(supervisor).

-export([start_link/1]).
-export([init/1]).

start_link(Arg) ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, Arg).

init([]) ->
	Procs = [],
	{ok, {{one_for_one, 1, 5}, Procs}}.
