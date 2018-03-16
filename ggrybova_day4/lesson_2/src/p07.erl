-module(p07).
-export([flatten/1]).

flatten(L) ->
        flatten(L, []).
flatten([H|T], Acc) ->
	flatten(H, flatten(T, Acc));
flatten([], Acc) ->
	Acc;
flatten(T, Acc) ->
	[T|Acc].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

flatten_test() -> [
?assertEqual([], flatten([])),
?assertEqual([a], flatten([a])),
?assertEqual([a], flatten([[[a]]])),
?assertEqual([a, b, c, d, e], flatten([a,[],[b,[c,d],e]])),
?assertEqual([a, b, c, d, e], flatten([a,[],[b,[c,d],e]])),
?assertEqual([a, b, c, d, e, f, g, h], flatten([a,[],[b,[c,[d, [e, [f]], [[[]]], [[g]]]],h]]))
].

-endif.
