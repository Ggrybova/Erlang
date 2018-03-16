-module(p04).
-export([len/1]).

len([]) ->
	0;
len([_H|L]) ->
	1 + len(L).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

len_test() -> [
?assertEqual(0, len([])),
?assertEqual(1, len([1])),
?assertEqual(4, len([a, b, c, d]))
].

-endif.
