-module(p03).
-export([element_at/2]).

element_at([], _N) ->
	undefined; 
element_at([H|_L], 1) ->
	H;
element_at([_H|L], N) ->
	element_at(L, N - 1).
