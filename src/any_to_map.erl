-module(any_to_map).

-export([convert/1]).

convert(Value) when is_map(Value) ->
    {ok, Value};
convert(Value) when is_tuple(Value) ->
    {ok, maps:from_list([Value])};
convert(Value) when is_list(Value) ->
    try maps:from_list(Value) of
        Map -> {ok, Map}
    catch
        error:_ -> {error, cannot_cast}
    end;
convert(_Value) ->
    {error, cannot_cast}.
