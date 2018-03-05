-module(p06).
-export([is_palindrome/1]).

is_palindrome(L) ->
	is_palindrome(L, L, []).
is_palindrome(L,[],L) ->
	true;
is_palindrome(X,[], L) ->
	false;
is_palindrome(X,[H|T],L) ->
	is_palindrome(X,T,[H|L]).
