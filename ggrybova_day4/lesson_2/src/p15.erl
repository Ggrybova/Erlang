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
	
