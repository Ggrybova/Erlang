-module(p10).
-compile(export_all).
-import(p09, [pack/1]).
-import(p05, [reverse/1]).
-import(p04, [len/1]).
-import(p01, [last/1]).

encode([]) ->
	[];
encode([H|[]]) ->
	[{1,H}];
encode(L) ->
	encode(pack(L), []).

encode([], Acc) ->
	reverse(Acc);
encode([H|T], Acc) ->
	encode(T, [{len(H), last(H)}|Acc]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

encode_test() -> [
?assertEqual([], encode([])),
?assertEqual([{1,a}], encode([a])),
?assertEqual([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}], encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
].

-endif.
