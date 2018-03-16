-module(p08).
-export([compress/1]).
-import(p05, [reverse/1]).

compress(L) -> compress(L, []).
compress([], L) -> reverse(L);
compress([H|T], [H|L]) -> compress(T, [H|L]);
compress([H|T], L) -> compress(T, [H|L]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

compres_test() -> [
?assertEqual([], compress([])),
?assertEqual([a], compress([a])),
?assertEqual([a, b], compress([a, b])),
?assertEqual([a, b, c, d, b, a], compress([a, b, b, c, c, c, d, d, d, d, b, a, a])),
?assertEqual([a, b, c, a, d, e], compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
].

-endif.
