-module(p14).
-compile(export_all).

duplicate([]) ->
	[];
duplicate([H|[]]) ->
	[H, H];
duplicate([H|T]) ->
	[H|[H|duplicate(T)]].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

duplicate_test() -> [
?assertEqual([], duplicate([])),
?assertEqual([a,a], duplicate([a])),
?assertEqual([a,a,b,b,c,c,c,c,d,d], duplicate([a,b,c,c,d]))
].

-endif.
