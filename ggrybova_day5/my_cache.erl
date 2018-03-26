-module(my_cache).
-compile(export_all).

create() ->
	ets:new(cache, [named_table]).
create(Key, Value, Time) ->
	ets:insert(my_cache:create(), {Key, Value, Time}).
insert(Key, Value, Time) ->
	ets:insert(cache, {Key, Value, Time}).
lookup(Key) ->
	ets:lookup(cache, Key).
delete(Key) ->
	ets:delete(cache, Key).

%delete() ->
%	ets:match_delete(cache, {'_', '-', '_'}).
