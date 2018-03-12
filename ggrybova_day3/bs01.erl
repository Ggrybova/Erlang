-module(bs01).
-export([first_word/1]).

first_word(<<>>) ->
	<<>>;
first_word(Bin) ->
	first_word(Bin, <<>>).

first_word(<<" ", _Y/binary>>, Acc) ->
	Acc;
first_word(<<X, Y/binary>>, Acc) ->
	first_word(Y, <<Acc/binary, X>>);
first_word(<<>>, Acc) ->
	Acc.
	
