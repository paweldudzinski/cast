-module(any_to_list).

-export([convert/1]).

convert(Value) when is_list(Value) ->
    {ok, Value};
convert(Value) when is_integer(Value) ->
    {ok, integer_to_list(Value)};
convert(Value) when is_float(Value) ->
    {ok, float_to_list(Value, [{decimals, 10}, compact])};
convert(Value) when is_binary(Value) ->
    {ok, binary_to_list(Value)};
convert(Value) when is_atom(Value) ->
    {ok, atom_to_list(Value)};
convert(Value) when is_tuple(Value) ->
    {ok, tuple_to_list(Value)};
convert(Value) ->
    {ok, [Value]}.
