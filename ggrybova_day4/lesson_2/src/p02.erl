-module(p02).
-export([but_last/1]).

but_last([H|[]]) ->
	H;
but_last([H|[L|[]]]) ->
	[H, L];
but_last([_H|L]) ->
	but_last(L).

