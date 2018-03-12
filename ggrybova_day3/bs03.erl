-module(bs03).
-compile(export_all).
-import(p07, [flatten/1]).

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
