{-# LANGUAGE OverloadedStrings #-}

module TD.Query.LogOut where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent
data LogOut = LogOut
  {
  }
  deriving (Eq)

instance Show LogOut where
  show LogOut =
    "LogOut"
      ++ U.cc
        []

instance T.ToJSON LogOut where
  toJSON LogOut =
    A.object
      [ "@type" A..= T.String "logOut"
      ]
