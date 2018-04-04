-module(cache_api).
-behaviour(gen_server).

-export([start_link/1]).
-export([insert/3]).
-export([lookup/1]).
-export([lookup_by_date/2]).
-export([delete/1]).
-export([delete_obsolete/0]).
-export([stop/1]).

start_link([Interval]) ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, [Interval], []).

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
.