-module(any_to_binary).

-export([convert/1]).

convert(Value) when is_binary(Value) ->
    {ok, Value};
convert(Value) when is_integer(Value) ->
    {ok, integer_to_binary(Value)};
convert(Value) when is_float(Value) ->
    {ok, list_to_binary(float_to_list(Value, [{decimals, 2}]))};
convert(Value) when is_atom(Value) ->
    {ok, atom_to_binary(Value, utf8)};
convert(Value) when is_list(Value) ->
    {ok, list_to_binary(Value)};
convert(_Value) ->
    {error, cannot_convert}.
