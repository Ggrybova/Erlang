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

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

decode_test() -> [
?assertEqual([], decode([])),
?assertEqual([a], decode([{1,a}])),
?assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]))
].

-endif.
