-module(p08).
-export([compress/1]).
-export([reverse/1]).

reverse(L) ->
	reverse(L, []).
reverse([], L) ->
	L;
reverse([H|T],L) ->
	reverse(T,[H|L]).

compress(L) -> compress(L, []).
compress([], L) -> reverse(L);
compress([H|T], [H|L]) -> compress(T, [H|L]);
compress([H|T], L) -> compress(T, [H|L]).
