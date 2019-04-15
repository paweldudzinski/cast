-module(any_to_string_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:string(X)).

string_to_string_test() ->
    ?assertEqual(?F("10"), {ok, "10"}).

integer_to_string_test() ->
    ?assertEqual(?F(10), {ok, "10"}).

float_to_string_test() ->
    ?assertEqual(?F(10.12), {ok, "10.12"}).

binary_to_string_test() ->
    ?assertEqual(?F(<<"bin">>), {ok, "bin"}).

atom_to_string_test() ->
    ?assertEqual(?F(erlang), {ok, "erlang"}).

tuple_to_string_test() ->
    Tuple = {this, is, sparta},
    ?assertEqual(?F(Tuple), {error, cannot_convert}).

map_to_list_test() ->
    Map = #{a => 1, b => 2},
    ?assertEqual(?F(Map), {error, cannot_convert}).
