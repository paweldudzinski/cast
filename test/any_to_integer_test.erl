-module(any_to_integer_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:integer(X)).

integer_to_integer_test() ->
    ?assertEqual(?F(10), 10),
    ?assertEqual(?F(-10), -10).

float_to_integer_test() ->
    ?assertEqual(?F(7.2), 7),
    ?assertEqual(?F(8312.23), 8312),
    ?assertEqual(?F(-10.0), -10).

binary_to_integer_test() ->
    ?assertEqual(?F(<<"3">>), 3),
    ?assertEqual(?F(<<"-3">>), -3).

string_to_integer_test() ->
    ?assertEqual(?F("10.3"), 10),
    ?assertEqual(?F("20"), 20),
    ?assertEqual(?F("20a"), {error, cannot_cast}).
