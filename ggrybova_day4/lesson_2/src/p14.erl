-module(p14).
-compile(export_all).

duplicate([]) ->
	[];
duplicate([H|[]]) ->
	[H, H];
duplicate([H|T]) ->
	[H|[H|duplicate(T)]].
