-module(p08).
-export([compress/1]).
-import(p05, [reverse/1]).

compress(L) -> compress(L, []).
compress([], L) -> reverse(L);
compress([H|T], [H|L]) -> compress(T, [H|L]);
compress([H|T], L) -> compress(T, [H|L]).
