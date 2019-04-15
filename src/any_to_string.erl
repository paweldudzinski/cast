-module(any_to_string).

-export([convert/1]).

convert(Value) when is_list(Value) ->
    Value;
convert(Value) when is_integer(Value) ->
    integer_to_list(Value);
convert(Value) when is_float(Value) ->
    float_to_list(Value, [{decimals, 10}, compact]);
convert(Value) when is_binary(Value) ->
    binary_to_list(Value);
convert(Value) when is_atom(Value) ->
    atom_to_list(Value);
convert(_Value) ->
    {error, cannot_convert}.

