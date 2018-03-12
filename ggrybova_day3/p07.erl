-module(p07).
-export([flatten/1]).

flatten(L) ->
        flatten(L, []).
flatten([H|T], Acc) ->
	flatten(H, flatten(T, Acc));
flatten([], Acc) ->
	Acc;
flatten(T, Acc) ->
	[T|Acc].
