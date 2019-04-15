-module(cast).
-author("Pawel Dudzinski <paweldudzinski@gmail.com>").

-export([integer/1,
        float/1,
        atom/1,
        binary/1,
        map/1,
        list/1,
        string/1]).

-type error() :: {error, cannot_cast}.

-spec integer(any()) -> integer() | error().
integer(Value) ->
    any_to_integer:convert(Value).

-spec float(any()) -> float() | error().
float(Value) ->
    any_to_float:convert(Value).

-spec atom(any()) -> atom() | error().
atom(Value) ->
    any_to_atom:convert(Value).

-spec binary(any()) -> binary() | error().
binary(Value) ->
    any_to_binary:convert(Value).

-spec map(any()) -> map() | error().
map(Value) ->
    any_to_map:convert(Value).

-spec list(any()) -> list() | error().
list(Value) ->
    any_to_list:convert(Value).

-spec string(any()) -> string() | error().
string(Value) ->
    any_to_string:convert(Value).
