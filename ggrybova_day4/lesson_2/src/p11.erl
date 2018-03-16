-module(p11).
-compile(export_all).
-import(p09, [pack/1]).
-import(p05, [reverse/1]).
-import(p04, [len/1]).
-import(p01, [last/1]).

encode_modified([]) ->
	[];
encode_modified([H|[]]) ->
	[H];
encode_modified(L) ->
	encode_modified(pack(L), []).

encode_modified([], Acc) ->
	reverse(Acc);
encode_modified([[H|[]]|T], Acc) ->
	encode_modified(T, [H|Acc]);
encode_modified([H|T], Acc) ->
	encode_modified(T, [{len(H), last(H)}|Acc]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

encode_modified_test() -> [
?assertEqual([], encode_modified([])),
?assertEqual([a], encode_modified([a])),
?assertEqual([{4,a},b,{2,c},{2,a},d,{4,e}], encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
].

-endif.
