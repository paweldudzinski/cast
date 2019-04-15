-module(any_to_integer).

-export([convert/1]).

convert(Value) when is_integer(Value) ->
    Value;
convert(Value) when is_float(Value) ->
    List = float_to_list(Value, [{decimals, 0}]),
    list_to_integer(List);
convert(Value) when is_binary(Value) ->
    try binary_to_integer(Value) of
        Integer -> Integer
    catch
        error:_ -> {error, cannot_cast}
    end;
convert(Value) when is_list(Value) ->
    TryFloatFirst = try list_to_float(Value) of
        Float -> float_to_list(Float, [{decimals, 0}])
    catch
        error:_ -> Value
    end,
    try list_to_integer(TryFloatFirst) of
        Integer -> Integer
    catch
        error:_ -> {error, cannot_cast}
    end;
convert(_Value) ->
    {error, cannot_cast}.
