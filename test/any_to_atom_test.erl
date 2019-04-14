-module(any_to_atom_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:atom(X)).

atom_to_atom_test() ->
    Atom = theatom,
    ?assertEqual(?F(Atom), {ok, Atom}).

integer_to_atom_test() ->
    ?assertEqual(?F(10), {ok, '10'}),
    ?assertEqual(?F(-10), {ok, '-10'}).

float_to_atom_test() ->
    ?assertEqual(?F(10.14), {ok, '10.14'}),
    ?assertEqual(?F(-10.14), {ok, '-10.14'}).

binary_to_atom_test() ->
    ?assertEqual(?F(<<"bin">>), {ok, bin}),
    ?assertEqual(?F(<<"bin bin">>), {ok,'bin bin'}),
    ?assertEqual(?F(<<"10">>), {ok,'10'}).

string_to_atom_test() ->
    ?assertEqual(?F("string"), {ok, string}),
    ?assertEqual(?F("string string"), {ok, 'string string'}),
    ?assertEqual(?F("10"), {ok, '10'}).

tuple_to_atom_test() ->
    ?assertEqual(?F({the, tuple}), {error, cannot_convert}).
