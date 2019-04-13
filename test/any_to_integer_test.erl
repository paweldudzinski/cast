-module(any_to_integer_test).
-include_lib("eunit/include/eunit.hrl").

integer_to_integer_test() ->
    ?assertEqual(cast:integer(10), {ok, 10}),
    ?assertEqual(cast:integer(-10), {ok, -10}).

float_to_integer_test() ->
    ?assertEqual(cast:integer(7.2), {ok, 7}),
    ?assertEqual(cast:integer(8312.23), {ok, 8312}),
    ?assertEqual(cast:integer(-10.0), {ok, -10}).

string_to_integer_test() ->
    ?assertEqual(cast:integer("10.3"), {ok, 10}),
    ?assertEqual(cast:integer("20"), {ok, 20}),
    ?assertEqual(cast:integer("20a"), {error, cannot_cast}).
