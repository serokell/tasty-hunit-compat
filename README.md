# Tasty-hunit-compat

This package provides a proper integration of `HUnit` package with `tasty` testing framework.

Problem with `tasty-hunit` package is that it defines its own primitives so tests written using `HUnit` cannot work properly. In particular, `HUnitFailure` exception of `HUnit` package is not handled as assertion error.

One solution would be not to use `HUnit` at all, but we find this fragile and inconvenient.

This subproject should be moved to a separate repository soon.
