-module(p13).
-compile(export_all).
-import(p07, [flatten/1]).

decode([]) ->
	[];
decode([H|T]) ->
	flatten(decode(H, T, [])).

decode([], [], Acc) ->
	Acc;
decode([], [H|T], Acc) ->
	decode(H, T, Acc);
decode({0, _}, T, Acc) ->
	decode([], T, [Acc]);
decode({N, H}, T, Acc) ->
	decode({N - 1, H}, T, [Acc|[H]]).
