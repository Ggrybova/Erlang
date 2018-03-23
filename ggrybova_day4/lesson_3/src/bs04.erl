-module(bs04).
-compile(export_all).
-import(p05, [reverse/1]).
-import(p07, [flatten/1]).

decode_xml(<<>>) ->
	{};

decode_xml(Bin) ->
	decode_xml_title(<<>>, Bin, <<>>, {}).	

decode_xml_title(Title, Text, Rest, Acc) ->
	case Text of
		<<"<", Y/binary>> ->
			decode_xml_title(Title, Y, Rest, Acc);
		<<">", Y/binary>> ->
			decode_xml_text(Y, Title, <<>>, Rest, Acc);
		<<>> ->
			Title;
		<<X, Y/binary>> ->
			decode_xml_title(<<Title/binary, X>>, Y, Rest, Acc)
	end.

decode_xml_text(Bin, Title, Text, Rest, Acc) ->
	case Bin of
		<<"<", _Y/binary>> ->
			decode_xml_close(Bin, Title, Text, Rest, Acc, length(binary_to_list(Title)));
		<<X, Y/binary>> ->
			decode_xml_text(Y, Title, <<Text/binary, X>>, Rest, Acc)
	end.

decode_xml_close(Bin, Title, Text, Rest, Acc, Len) ->
	case Bin of
		<<"</", Title:Len/binary, ">", Y/binary>> when Y /= <<>> ->
			flatten([{Title, [], [decode_xml(Text)]} | [decode_xml(Y)]]);
%			decode_xml({Title, [], [decode_xml(Text)]}, decode_xml(Y));
		<<"</", Title:Len/binary, ">", _Y/binary>> ->
			{Title, [], flatten([decode_xml(Text)])};
		<<X, Y/binary>> ->
			decode_xml_close(Y, Title, <<Text/binary, X>>, Rest, Acc, Len)
	end.
	
