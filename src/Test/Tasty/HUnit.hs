-- SPDX-FileCopyrightText: 2020 Tocqueville Group
--
-- SPDX-License-Identifier: LicenseRef-MIT-TQ

{-# LANGUAGE PackageImports #-}

-- | HUnit support for tasty.
--
-- We don't use `tasty-hunit` directly because it doesn't interoperate properly
-- with other HUnit-based code.
-- Specifically, it defines its own `HUnitFailure` type and catches exceptions
-- of this type. It doesn't catch HUnit's `HUnitFailure`, so they are not
-- pretty-printed.

module Test.Tasty.HUnit
  ( testCase
  , testCaseInfo
  , testCaseSteps

    -- * Re-exports
  , HUnit.assertFailure
  , HUnit.assertBool
  , HUnit.assertEqual
  , (HUnit.@=?)
  , (HUnit.@?=)
  , (HUnit.@?)
  , HUnit.AssertionPredicable(..)
  , HUnit.Assertion
  , HUnit.HUnitFailure
  , HasCallStack
  ) where

import Control.Exception (handle, throwIO)
import GHC.Stack (HasCallStack)
import Test.HUnit (Assertion)
import qualified Test.HUnit as HUnit
import qualified Test.HUnit.Lang as HUnit
import Test.Tasty (TestName, TestTree)
import qualified "tasty-hunit" Test.Tasty.HUnit as Tasty.HUnit

-- | Turn @HUnit@ assertion into @Tasty.HUnit@ one.
adjustSuite :: IO a -> IO a
adjustSuite =
  -- All we need is to modify thrown exception
  handle $ \(HUnit.HUnitFailure mloc reason) ->
    let reason' = (HUnit.formatFailureReason reason)
    in throwIO $ Tasty.HUnit.HUnitFailure mloc reason'

-- | Turn an 'Assertion' into a tasty test case
testCase :: TestName -> Assertion -> TestTree
testCase name = Tasty.HUnit.testCase name . adjustSuite

testCaseInfo :: TestName -> IO String -> TestTree
testCaseInfo name = Tasty.HUnit.testCaseInfo name . adjustSuite

testCaseSteps :: TestName -> ((String -> IO ()) -> Assertion) -> TestTree
testCaseSteps name f = Tasty.HUnit.testCaseSteps name (\step -> adjustSuite $ f step)
