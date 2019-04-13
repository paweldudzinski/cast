-module(cast).
-author("Pawel Dudzinski <paweldudzinski@gmail.com>").

-export([integer/1,
        float/1,
        atom/1,
        binary/1,
        map/1,
        list/1,
        string/1]).

-spec integer(any()) -> integer().
integer(Value) ->
    any_to_integer:convert(Value).

-spec float(any()) -> float().
float(Value) ->
    any_to_float:convert(Value).

-spec atom(any()) -> atom().
atom(Value) ->
    any_to_atom:convert(Value).

-spec binary(any()) -> binary().
binary(Value) ->
    any_to_binary:convert(Value).

-spec map(any()) -> map().
map(Value) ->
    any_to_map:convert(Value).

-spec list(any()) -> list().
list(Value) ->
    any_to_list:convert(Value).

-spec string(any()) -> string().
string(Value) ->
    any_to_string:convert(Value).
