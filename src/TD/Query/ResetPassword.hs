{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResetPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time
data ResetPassword = ResetPassword
  {
  }
  deriving (Eq)

instance Show ResetPassword where
  show ResetPassword =
    "ResetPassword"
      ++ U.cc
        []

instance T.ToJSON ResetPassword where
  toJSON ResetPassword =
    A.object
      [ "@type" A..= T.String "resetPassword"
      ]
