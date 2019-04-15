-module(any_to_float_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:float(X)).

float_to_float_test() ->
    ?assertEqual(?F(10.0), 10.0),
    ?assertEqual(?F(-10.42), -10.42).

integer_to_float_test() ->
    ?assertEqual(?F(10), 10.0),
    ?assertEqual(?F(-7), -7.0).

binary_to_float_test() ->
    ?assertEqual(?F(<<"13.4">>), 13.4),
    ?assertEqual(?F(<<"3">>), 3.0),
    ?assertEqual(?F(<<"-3">>), -3.0).

string_to_float_test() ->
    ?assertEqual(?F("10.3"), 10.3),
    ?assertEqual(?F("20"), 20.0),
    ?assertEqual(?F("20a"), {error, cannot_cast}).
