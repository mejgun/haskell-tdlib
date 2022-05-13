{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMe where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the current user
data GetMe = GetMe
  {
  }
  deriving (Eq)

instance Show GetMe where
  show GetMe =
    "GetMe"
      ++ U.cc
        []

instance T.ToJSON GetMe where
  toJSON GetMe =
    A.object
      [ "@type" A..= T.String "getMe"
      ]
