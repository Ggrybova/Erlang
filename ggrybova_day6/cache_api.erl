-module(cache_api).
-behaviour(gen_server).

-export([start_link/1]).
-export([insert/3]).
-export([lookup/1]).
-export([lookup_by_date/2]).
-export([delete/1]).
-export([delete_obsolete/0]).
-export([stop/0]).

start_link([Arg]) ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, [Arg], []).

insert() ->
.

lookup() ->
.

lookup_by_date() ->
.

delete() ->
.

delete_obsolete() ->
.

stop() ->
	gen_server:stop(?MODULE).