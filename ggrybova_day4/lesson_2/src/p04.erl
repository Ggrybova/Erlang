-module(p04).
-export([len/1]).

len([]) ->
	0;
len([_H|L]) ->
	1 + len(L).
