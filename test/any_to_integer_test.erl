-module(any_to_integer_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:integer(X)).

integer_to_integer_test() ->
    ?assertEqual(?F(10), {ok, 10}),
    ?assertEqual(?F(-10), {ok, -10}).

float_to_integer_test() ->
    ?assertEqual(?F(7.2), {ok, 7}),
    ?assertEqual(?F(8312.23), {ok, 8312}),
    ?assertEqual(?F(-10.0), {ok, -10}).

binary_to_integer_test() ->
    ?assertEqual(?F(<<"3">>), {ok, 3}),
    ?assertEqual(?F(<<"-3">>), {ok, -3}).

string_to_integer_test() ->
    ?assertEqual(?F("10.3"), {ok, 10}),
    ?assertEqual(?F("20"), {ok, 20}),
    ?assertEqual(?F("20a"), {error, cannot_cast}).
