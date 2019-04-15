-module(any_to_map_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:map(X)).

map_to_map_test() ->
    Map = maps:put(test, 1, maps:new()),
    ?assertEqual(cast:map(Map), #{test => 1}).

tuple_to_map_test() ->
    Tuple = [{test, me}, {right, now}],
    ?assertEqual(cast:map(Tuple), #{test => me, right => now}).

list_to_map_test() ->
    Proplist = [{test, me}, {right, now}],
    ?assertEqual(cast:map(Proplist), #{test => me, right => now}).

other_to_map_test() ->
    ?assertEqual(cast:map(1), {error, cannot_cast}),
    ?assertEqual(cast:map(1.0), {error, cannot_cast}),
    ?assertEqual(cast:map("string"), {error, cannot_cast}),
    ?assertEqual(cast:map(atom), {error, cannot_cast}),
    ?assertEqual(cast:map(<<"bin">>), {error, cannot_cast}).
