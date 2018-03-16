-module(p01).
-export([last/1]).

last([]) ->
	"bad argument";
last([H|[]]) ->
	H;
last([_H|T]) ->
	last(T).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

last_test() -> [
?assertEqual("bad argument", last([])),
?assertEqual(1, last([1])),
?assertEqual(f, last([a,b,c,d,e,f]))
].

-endif.
