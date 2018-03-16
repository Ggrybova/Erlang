-module(p09).
-import(p07, [flatten/1]).
-import(p05, [reverse/1]).
-export([pack/1]).

pack([]) ->
	[];
pack([H|T]) ->
	pack(H, T, []).

pack([], [], Acc) ->
	reverse(Acc);
pack(H, [H|T], Acc) ->
	pack([H|[H]], T, Acc);
pack([H|T1], [H|T2], Acc) ->
	pack([H|[H|T1]], T2, Acc);
pack(H, [H2|T], Acc) ->
	pack([H2], T, [flatten(H)|Acc]);
pack(H, [], Acc) ->
	pack([], [], [H|Acc]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

pack_test() -> [
?assertEqual([], pack([])),
?assertEqual([[a], [b]], pack([a, b])),
?assertEqual([[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]], pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
].

-endif.	
