# Tasty-hunit-compat

![Build status](https://github.com/serokell/tasty-hunit-compat/workflows/CI/badge.svg)

:shrug:

This library implements the integration between [tasty](https://hackage.haskell.org/package/tasty) and [HUnit](https://hackage.haskell.org/package/HUnit) packages.

The way tasty provides this integration is reimplementing HUnit primitives, and this does not work with test suites written with the original HUnit library.
One issue we are aware of is that test failures are treated as plain exceptions, not true failures.

## Build Instructions [↑](#-patak)

Run `make` to build everything.

## Usage [↑](#-patak)

Use `testCase` or more advanced primitives to lift HUnit's `Assertion` to tasty's `TestTree`.

Commonly useful methods from `HUnit` are also re-exported.

```haskell
import Test.Tasty (TestTree)
import Test.Tasty.HUnit (testCase, (@?=))

test_Reversals :: [TestTree]
test_Reversals =
  [ testCase "Simple case" $
      reverse "abc" @?= "cba"
  ]
```

## Issue Tracker [↑](#-patak)

We use GitHub issues as our issue tracker.
You can login using your GitHub account to leave a comment or create a new issue.

## For Contributors [↑](#-patak)

Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md) for more information.

## About Serokell [↑](#-patak)

`tasty-hunit-compat` is maintained and funded with ❤️ by [Serokell](https://serokell.io/).
The names and logo for Serokell are trademark of Serokell OÜ.

We love open source software! See [our other projects](https://serokell.io/community?utm_source=github) or [hire us](https://serokell.io/hire-us?utm_source=github) to design, develop and grow your idea!
