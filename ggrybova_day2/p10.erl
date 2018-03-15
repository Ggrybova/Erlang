-module(p10).
-compile(export_all).
-import(p09, [pack/1]).
-import(p04, [len/1]).
-import(p01, [last/1]).

encode([]) ->
	[];
encode(L) ->
	encode(pack(L), []).

encode([], Acc) ->
	Acc;
encode([H|T], Acc) ->
	encode(T, [{len(H), last(H)}|Acc]).
