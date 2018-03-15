-module(p12).
-compile(export_all).
-import(p07, [flatten/1]).

decode_modified([]) ->
	[];
decode_modified([H|T]) ->
	flatten(decode_modified(H, T, [])).

decode_modified([], [], Acc) ->
	Acc;
decode_modified([], [H|T], Acc) ->
	decode_modified(H, T, Acc);
decode_modified({0, _}, T, Acc) ->
	decode_modified([], T, [Acc]);
decode_modified({N, H}, T, Acc) ->
	decode_modified({N - 1, H}, T, [Acc|[H]]);
decode_modified(H, T, Acc) ->
	decode_modified([], T, [Acc|[H]]).
