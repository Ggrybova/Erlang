-module(p09).
-export([pack/1]).
-export([reverse/1]).

reverse(L) ->
	reverse(L, []).
reverse([], L) ->
	L;
reverse([H|T],L) ->
	reverse(T,[H|L]).

pack(L) -> pack(L, [], []).
pack([], [], L) -> reverse(L);
pack([H|T], [], L) -> pack(T, H, L);
pack([], T, L) -> pack([], [], [T|L]);
pack([H|T], H, L) -> pack(T, [H|[H]], L);
pack([H|T], H2, L) -> pack(T, H, [H2|L]).
