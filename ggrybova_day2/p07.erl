-module(p07).
-export([flatten/1]).

flatten([H|T]) -> flatten(H, T, []).
flatten([H|HN], T, L) -> flatten(HN, T, [H|L]);
flatten([], [T|TN], L) -> flatten(T, TN, L);
flatten([], [], L) -> flatten(L,[]);
flatten(H, [], L) -> flatten([], [], [H|L]);
flatten(H, T, L) -> flatten([], T, [H|L]).
flatten([],L) -> L;
flatten([H|T], L) -> flatten(T, [H|L]).

