-module(p05).
-export([reverse/1]).

reverse(L) ->
	reverse(L, []).
reverse([], L) ->
	L;
reverse([H|T],L) ->
	reverse(T,[H|L]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

reverse_test() -> [
?assertEqual([], reverse([])),
?assertEqual([a], reverse([a])),
?assertEqual([b, a], reverse([a, b])),
?assertEqual([5, 4, 3, 2, 1], reverse([1, 2, 3, 4, 5]))
].

-endif.
