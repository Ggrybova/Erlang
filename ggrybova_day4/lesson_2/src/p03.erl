-module(p03).
-export([element_at/2]).

element_at(_, 0) ->
	"bad argument"; 
element_at([], _N) ->
	undefined; 
element_at([H|_L], 1) ->
	H;
element_at([_H|L], N) ->
	element_at(L, N - 1).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

element_at_test() -> [
?assertEqual("bad argument", element_at([1], 0)),
?assertEqual(undefined, element_at([], 2)),
?assertEqual(undefined, element_at([1], 2)),
?assertEqual(1, element_at([1], 1)),
?assertEqual(d, element_at([a,b,c,d,e,f], 4)),
?assertEqual(undefined, element_at([a,b,c,d,e,f], 10))
].

-endif.
