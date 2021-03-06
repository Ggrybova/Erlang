-module(bs02).
-compile(export_all).
-import(p07, [flatten/1]).

words(Bin) ->
	words(Bin, <<>>).
words(<<" ", Y/binary>>, Acc) ->
	flatten([Acc|[words(Y)]]);
words(<<X, Y/binary>>, Acc) ->
	words(Y, <<Acc/binary, X>>);
words(<<>>, Acc) ->
	Acc.
