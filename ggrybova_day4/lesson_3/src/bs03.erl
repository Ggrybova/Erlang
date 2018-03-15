-module(bs03).
-compile(export_all).
-import(p07, [flatten/1]).

split(Bin, "") ->
	Bin;
split(Bin, Sep) ->
	split(Bin, <<>>, list_to_binary(Sep), length(Sep)).

split(Bin, Acc, Sep, Len) ->
	case Bin of
		<<>> ->
			Acc;
		<<Sep:Len/binary, Y/binary>> ->
			flatten([Acc|[split(Y, binary_to_list(Sep))]]);
		<<X, Y/binary>> ->
			split(Y, <<Acc/binary, X>>, Sep, Len)
	end.


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

split_test() -> [
	?assertEqual(<<>>, split(<<>>, "-")),
	?assertEqual(<<"Split">>, split(<<"Split">>, "")),
	?assertEqual(<<"Split Text">>, split(<<"Split Text">>, "")),
	?assertEqual([<<>>, <<>>], split(<<" ">>, " ")),
	?assertEqual(<<"Some Text">>, split(<<"Some Text">>, "-:-")),
	?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], split(<<"Text with four words">>, " ")),
	?assertEqual([<<>>, <<"Some">>, <<"Text">>], split(<<" Some Text">>, " ")),
	?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>], split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-"))

	].

-endif.
