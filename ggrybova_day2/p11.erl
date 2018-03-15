-module(p11).
-compile(export_all).
-import(p09, [pack/1]).
-import(p04, [len/1]).
-import(p01, [last/1]).

encode_modified([]) ->
	[];
encode_modified(L) ->
	encode_modified(pack(L), []).

encode_modified([], Acc) ->
	Acc;
encode_modified([[H|[]]|T], Acc) ->
	encode_modified(T, [H|Acc]);
encode_modified([H|T], Acc) ->
	encode_modified(T, [{len(H), last(H)}|Acc]).
