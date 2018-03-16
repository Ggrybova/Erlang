-module(p15).
-compile(export_all).
-import(p07, [flatten/1]).

replicate([], _) ->
	[];
replicate(_, 0) ->
	[];
replicate(L, 1) ->
	L;
replicate([H|[]], N) ->
	[H|replicate([H], N - 1)];
replicate([H|T], N) ->
	flatten([replicate([H], N)|replicate(T, N)]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

replicate_test() -> [
?assertEqual([], replicate([], 8)),
?assertEqual([a,a,a], replicate([a], 3)),
?assertEqual([a,a,a,a,b,b,b,b,c,c,c,c], replicate([a,b,c], 4))
].

-endif.
