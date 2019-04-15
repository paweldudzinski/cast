-module(any_to_map).

-export([convert/1]).

convert(Value) when is_map(Value) ->
    Value;
convert(Value) when is_tuple(Value) ->
    maps:from_list([Value]);
convert(Value) when is_list(Value) ->
    try maps:from_list(Value) of
        Map -> Map
    catch
        error:_ -> {error, cannot_cast}
    end;
convert(_Value) ->
    {error, cannot_cast}.
