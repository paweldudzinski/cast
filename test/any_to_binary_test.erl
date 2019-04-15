-module(any_to_binary_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:binary(X)).

binary_to_binary_test() ->
    Bin = <<"bin">>,
    ?assertEqual(?F(Bin), Bin).

integer_to_binary_test() ->
    ?assertEqual(?F(10), <<"10">>),
    ?assertEqual(?F(-10), <<"-10">>).

float_to_binary_test() ->
    ?assertEqual(?F(10.14), <<"10.14">>),
    ?assertEqual(?F(-10.14), <<"-10.14">>).

atom_to_binary_test() ->
    ?assertEqual(?F(atom), <<"atom">>).

string_to_binary_test() ->
    ?assertEqual(?F("string"), <<"string">>),
    ?assertEqual(?F("string string"), <<"string string">>),
    ?assertEqual(?F("10"), <<"10">>).

tuple_to_binary_test() ->
    ?assertEqual(?F({the, tuple}), {error, cannot_convert}).
