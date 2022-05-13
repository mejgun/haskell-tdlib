{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCurrentState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all updates needed to restore current TDLib state, i.e. all actual UpdateAuthorizationState/UpdateUser/UpdateNewChat and others. This is especially useful if TDLib is run in a separate process. Can be called before initialization
data GetCurrentState = GetCurrentState
  {
  }
  deriving (Eq)

instance Show GetCurrentState where
  show GetCurrentState =
    "GetCurrentState"
      ++ U.cc
        []

instance T.ToJSON GetCurrentState where
  toJSON GetCurrentState =
    A.object
      [ "@type" A..= T.String "getCurrentState"
      ]
