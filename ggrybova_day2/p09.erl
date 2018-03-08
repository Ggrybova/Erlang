-module(p09).
-export([pack/1]).

pack(L) ->
	pack(L, []).
pack([H|T], Acc) ->
	pack(H, pack(T, Acc));
pack([], Acc) ->
	Acc;
pack(H, []) ->
	H;
pack(H, [H|T]) ->
%	[H|[H|[T]]];
	[[H|[H]]|[T]];
	
pack(T, Acc) ->
	[T|Acc].
