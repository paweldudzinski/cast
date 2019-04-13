-module(any_to_float_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:float(X)).

float_to_float_test() ->
    ?assertEqual(?F(10.0), {ok, 10.0}),
    ?assertEqual(?F(-10.42), {ok, -10.42}).

integer_to_float_test() ->
    ?assertEqual(?F(10), {ok, 10.0}),
    ?assertEqual(?F(-7), {ok, -7.0}).

binary_to_float_test() ->
    ?assertEqual(?F(<<"13.4">>), {ok, 13.4}),
    ?assertEqual(?F(<<"3">>), {ok, 3.0}),
    ?assertEqual(?F(<<"-3">>), {ok, -3.0}).

string_to_float_test() ->
    ?assertEqual(?F("10.3"), {ok, 10.3}),
    ?assertEqual(?F("20"), {ok, 20.0}),
    ?assertEqual(?F("20a"), {error, cannot_cast}).
