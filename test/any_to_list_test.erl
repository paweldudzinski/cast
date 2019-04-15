-module(any_to_list_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:list(X)).

list_to_list_test() ->
    ?assertEqual(?F([1,2,3]), [1,2,3]).

integer_to_list_test() ->
    ?assertEqual(?F(10), "10").

float_to_list_test() ->
    ?assertEqual(?F(10.12), "10.12").

binary_to_list_test() ->
    ?assertEqual(?F(<<"bin">>), "bin").

atom_to_list_test() ->
    ?assertEqual(?F(erlang), "erlang").

tuple_to_list_test() ->
    Tuple = {this, is, sparta},
    ?assertEqual(?F(Tuple), [this, is, sparta]).

map_to_list_test() ->
    Map = #{a => 1, b => 2},
    ?assertEqual(?F(Map), [Map]).
