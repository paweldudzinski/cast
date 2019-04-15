-module(any_to_binary).

-export([convert/1]).

convert(Value) when is_binary(Value) ->
    Value;
convert(Value) when is_integer(Value) ->
    integer_to_binary(Value);
convert(Value) when is_float(Value) ->
    list_to_binary(float_to_list(Value, [{decimals, 10}, compact]));
convert(Value) when is_atom(Value) ->
    atom_to_binary(Value, utf8);
convert(Value) when is_list(Value) ->
    list_to_binary(Value);
convert(_Value) ->
    {error, cannot_convert}.
