-module(p02).
-export([but_last/1]).

but_last([]) ->
	"bad argument";
but_last([_H|[]]) ->
	"bad argument";
but_last([H|[L|[]]]) ->
	[H, L];
but_last([_H|L]) ->
	but_last(L).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

but_last_test() -> [
?assertEqual("bad argument", but_last([])),
?assertEqual("bad argument", but_last([1])),
?assertEqual([1, 2], but_last([1, 2])),
?assertEqual([e, f], but_last([a,b,c,d,e,f]))
].

-endif.

