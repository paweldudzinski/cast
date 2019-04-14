-module(any_to_atom).

-export([convert/1]).

convert(Value) when is_atom(Value) ->
    {ok, Value};
convert(Value) when is_integer(Value) ->
    {ok, list_to_atom(integer_to_list(Value))};
convert(Value) when is_float(Value) ->
    {ok, list_to_atom(float_to_list(Value, [{decimals, 2}]))};
convert(Value) when is_binary(Value) ->
    {ok, binary_to_atom(Value, utf8)};
convert(Value) when is_list(Value) ->
    {ok, list_to_atom(Value)};
convert(_Value) ->
    {error, cannot_convert}.
