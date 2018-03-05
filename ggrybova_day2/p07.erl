-module(p07).
-export([flatten/1]).

flatten(L) -> flatten(L, []).
flatten([H|T], L) -> flatten(H, T, L).
flatten([H|HN], T, L) -> func(H, HN);
flatten([], [T|TN], L) -> flatten(T, TN, L);
flatten(H, [], L) -> [H|[L]];
flatten([], [], L) -> L;
flatten(H, T, L) -> 1.
func(H, T) -> [H|[T]].

