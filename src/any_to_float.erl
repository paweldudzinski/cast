-module(any_to_float).

-export([convert/1]).

convert(Value) when is_float(Value) ->
    Value;
convert(Value) when is_integer(Value) ->
    List = integer_to_list(Value),
    list_to_float(List ++ ".0");
convert(Value) when is_binary(Value) ->
    case cast:integer(Value) of
        {error, cannot_cast} ->
            try binary_to_float(Value) of
                Integer -> Integer
            catch
                error:_ -> {error, cannot_cast}
            end;
        Integer -> convert(Integer)
    end;
convert(Value) when is_list(Value) ->
    TryIntFirst = try list_to_integer(Value) of
        Integer -> integer_to_list(Integer) ++ ".0"
    catch
        error:_ -> Value
    end,
    try list_to_float(TryIntFirst) of
        Float -> Float
    catch
        error:_ -> {error, cannot_cast}
    end;
convert(_Value) ->
    {error, cannot_cast}.
