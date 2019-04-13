PROJECT := cast

ERL := erl
EPATH = -pa _build/default/lib/cast/ebin

.PHONY: all compile configure console deps doc test

all: deps compile

compile:
	@./rebar3 compile

configure:
	@./rebar3 get-deps compile

console:
	$(ERL) -sname $(PROJECT) $(EPATH)

deps:
	@./rebar3 get-deps update-deps

test:
	@./rebar3 eunit
