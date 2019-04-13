Cast - convert values to any erlang type from any erlang type
=============================================================

[![Build Status](https://travis-ci.com/paweldudzinski/cast.svg?branch=master)](https://travis-ci.com/paweldudzinski/cast)
![Language](https://img.shields.io/badge/language-erlang-yellowgreen.svg)
[![License](https://img.shields.io/badge/License-Apache%202.0-9cf.svg)](https://opensource.org/licenses/Apache-2.0)
[![Latest Release][release badge]][release]
[![Last Commit][commit badge]][commit]

Installation
------------

`make deps compile test`

Available interfaces
--------------------

```erlang
cast:integer(Val)
cast:float(Val)
cast:atom(Val)
cast:binary(Val)
cast:map(Val)
cast:list(Val)
cast:string(Val)
```

<!-- Links (alphabetically) -->
[commit]: https://github.com/paweldudzinski/cast/commit/HEAD
[erlang]: http://www.erlang.org
[eunit stdout]: http://erlang.org/doc/apps/eunit/chapter.html#Running_EUnit
[release]: https://github.com/paweldudzinski/cast/releases/latest

<!-- Badges (alphabetically) -->
[commit badge]: https://img.shields.io/github/last-commit/paweldudzinski/cast.svg
[release badge]: https://img.shields.io/github/release/paweldudzinski/cast.svg
