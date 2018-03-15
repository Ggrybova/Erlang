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

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

words_test() -> [
	?assertEqual(<<>>, words(<<>>)),
	?assertEqual([<<>>, <<>>], words(<<" ">>)),
	?assertEqual([<<"Some">>, <<"Text">>], words(<<"Some Text">>)),
	?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], words(<<"Text with four words">>)),
	?assertEqual(<<"SomeText">>, words(<<"SomeText">>)),
	?assertEqual([<<>>, <<"Some">>, <<"Text">>], words(<<" Some Text">>))
	].

-endif.
