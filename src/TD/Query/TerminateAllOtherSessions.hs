{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TerminateAllOtherSessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Terminates all other sessions of the current user
data TerminateAllOtherSessions = TerminateAllOtherSessions
  {
  }
  deriving (Eq)

instance Show TerminateAllOtherSessions where
  show TerminateAllOtherSessions =
    "TerminateAllOtherSessions"
      ++ U.cc
        []

instance T.ToJSON TerminateAllOtherSessions where
  toJSON TerminateAllOtherSessions =
    A.object
      [ "@type" A..= T.String "terminateAllOtherSessions"
      ]
