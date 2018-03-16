-module(p06).
-export([is_palindrome/1]).
-import(p05, [reverse/1]).

is_palindrome(L) ->
	L == reverse(L).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

is_palindrome_test() -> [
?assertEqual(true, is_palindrome([])),
?assertEqual(true, is_palindrome([a])),
?assertEqual(false, is_palindrome([a, b])),
?assertEqual(true, is_palindrome([a, b, a])),
?assertEqual(true, is_palindrome([a, b, b, a])),
?assertEqual(false, is_palindrome([1, 2, 3, 4, 2, 1]))
].

-endif.
