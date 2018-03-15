-module(p09).
-import(p07, [flatten/1]).
-export([pack/1]).

pack([]) ->
	[];
pack([H|T]) ->
	pack(H, T, []).

pack([], [], Acc) ->
	Acc;
pack(H, [H|T], Acc) ->
	pack([H|[H]], T, Acc);
pack([H|T1], [H|T2], Acc) ->
	pack([H|[H|T1]], T2, Acc);
pack(H, [H2|T], Acc) ->
	pack(H2, T, [flatten(H)|Acc]);
pack(H, [], Acc) ->
	pack([], [], [H|Acc]).
	
