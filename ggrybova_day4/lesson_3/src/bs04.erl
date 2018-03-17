-module(bs04).
-compile(export_all).
-import(p05, [reverse/1]).

len(Bin, Sep, Len) ->
	case Bin of
		<<Sep:Len/binary, _Y/binary>> ->
			0;
		<<_X, Y/binary>> ->
			1 + len(Y, Sep, Len)
	end.

cut_back(Bin, Len) ->
	<<Bin:Len/binary>>.
cut_head(<<X, Bin/binary>>, Len) ->
	case Len of
		0 ->
			<<X, Bin/binary>>;
		_N ->
			cut_head(Bin, Len - 1)
	end.

tegs(Bin, Sep, Len, Acc) ->
	case Bin of
		<<Sep:Len/binary, Y/binary>> ->
			tegs(Y, Sep, Len, [cut_back(Y, len(Y, list_to_binary(">"), 1))|Acc]);
		<<_X, Y/binary>> ->
			tegs(Y, Sep, Len, Acc);
		<<>> ->
			reverse(Acc)
	end.

decode_xml(Bin) ->
	Arr = tegs(Bin, list_to_binary("<"), 1, []), 
	decode_xml(Bin, Arr, length(Arr)/2, length(Arr)/2, [], []).

decode_xml(_Bin, [], _N1, _N2, Acc, _Text) ->
	list_to_tuple(reverse(Acc));

decode_xml(Bin, [H|T], N1, N2, Acc, Text) ->
	Len = length(binary_to_list(H)),
	if
		N1 == N2 ->
			case Bin of
				<<>> ->
					Acc;
				<<H:Len/binary, _X, Y/binary>> ->
					decode_xml(Y, T, N1 - 1, N2, [H|Acc], Text);
				<<_X, Y/binary>> ->
					decode_xml(Y, [H|T], N1, N2, Acc, Text)
			end;

		true ->
			case Bin of
				<<>> ->
					Acc;
				<<H:Len/binary, _X, Y/binary>> ->
%					decode_xml(Y, T, N1, N2 - 1, [list_to_binary(reverse(Text)), [] |Acc], Text);
					[list_to_tuple(reverse([list_to_binary(reverse(Text)), [] |Acc]))|[decode_xml(Y, T, 2, 2, [], [])]];
				<<"<", Y/binary>> ->
					decode_xml(Y, [H|T], N1, N2, Acc, Text);
				<<X, Y/binary>> ->
					decode_xml(Y, [H|T], N1, N2, Acc, [X|Text])
			end
		end.
	
%tegs(Bin, Acc, Word) ->
%	case Bin of
%		<<>> ->
%			Acc;
%		<<"<", Y/binary>> ->
			
