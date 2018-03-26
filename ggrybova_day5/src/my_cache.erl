-module(my_cache).
-compile(export_all).

create() ->
	ets:new(cache, [named_table]),
	ok.

create(Key, Value, Limit) ->
	ets:insert(my_cache:create(), {Key, Value, os:timestamp(), Limit}),
	ok.

insert(Key, Value, Limit) ->
	ets:insert(cache, {Key, Value, element(2, os:timestamp()), Limit}),
	ok.

lookup(Key) ->
	[[Val]] = ets:match(cache, {Key, '$2', '_', '_'}),
	case check_time(Key) of
		1 -> {ok, Val};
		0 -> []
	end.

delete(Key) ->
	ets:delete(cache, Key).

delete() ->
	ets:delete(cache).

table_to_list() ->
	ets:tab2list(cache).

check_time(Key) ->
	[[Lim]] = ets:match(cache, {Key, '_', '_', '$4'}),
	[[A]] = ets:match(cache, {Key, '_', '$3', '_'}),
	B = element(2, os:timestamp()),
	C = B - A,
	if
		C < Lim -> 1;
		C >= Lim -> 0
	end.

delete_obsolete() ->
	delete_obsolete(ets:first(cache)).

delete_obsolete(Id) ->
	Next = ets:next(cache, Id),	
	case lookup(Id) of
		[] -> delete(Id);
		_ -> ok
	end,
	case Next of
		'$end_of_table' -> ok;
		_ -> delete_obsolete(Next)
	end.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

t1_test() -> [
	?assertEqual(ok, my_cache:create()),
	?assertEqual(ok, my_cache:insert(key1, value1, 3)),
	?assertEqual(ok, my_cache:insert(key2, value2, 2)),
	?assertEqual(ok, my_cache:insert(key3, value3, 4)),
	?assertEqual({ok, value1}, my_cache:lookup(key1)),
	?assertEqual({ok, value2}, my_cache:lookup(key2)),
	?assertEqual({ok, value3}, my_cache:lookup(key3)),
	timer:sleep(timer:seconds(2)),
	?assertEqual({ok, value1}, my_cache:lookup(key1)),
	?assertEqual([], my_cache:lookup(key2)),
	?assertEqual({ok, value3}, my_cache:lookup(key3)),
	timer:sleep(timer:seconds(2)),
	?assertEqual([], my_cache:lookup(key1)),
	?assertEqual([], my_cache:lookup(key3)),
	?assert(my_cache:table_to_list() /= []),
	?assertEqual(ok, my_cache:delete_obsolete()),
	?assertEqual([], my_cache:table_to_list())
].

-endif.
