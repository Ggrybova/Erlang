-module(my_cache).
-compile(export_all).

create() ->
	ets:new(cache, [named_table]),
	ok.

%create(Key, Value, Limit) ->
%	ets:insert(my_cache:create(), {Key, Value, now(), Limit}).

insert(Key, Value, Limit) ->
	ets:insert(cache, {Key, Value, element(2, now()), Limit}),
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
	B = element(2, now()),
	C = B - A,
	if
		C < Lim -> 1;
		C >= Lim -> 0
	end.


%delete() ->
%	ets:match_delete(cache, {'_', '-', '_'}).
