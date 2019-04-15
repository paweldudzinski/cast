-module(any_to_atom_test).
-include_lib("eunit/include/eunit.hrl").

-define(F(X), cast:atom(X)).

atom_to_atom_test() ->
    Atom = theatom,
    ?assertEqual(?F(Atom), Atom).

integer_to_atom_test() ->
    ?assertEqual(?F(10), '10'),
    ?assertEqual(?F(-10), '-10').

float_to_atom_test() ->
    ?assertEqual(?F(10.14), '10.14'),
    ?assertEqual(?F(-10.14), '-10.14').

binary_to_atom_test() ->
    ?assertEqual(?F(<<"bin">>), bin),
    ?assertEqual(?F(<<"bin bin">>), 'bin bin'),
    ?assertEqual(?F(<<"10">>), '10').

string_to_atom_test() ->
    ?assertEqual(?F("string"), string),
    ?assertEqual(?F("string string"), 'string string'),
    ?assertEqual(?F("10"), '10').

tuple_to_atom_test() ->
    ?assertEqual(?F({the, tuple}), {error, cannot_convert}).
