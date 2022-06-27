{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPremiumState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns state of Telegram Premium subscription and promotion videos for Premium features
data GetPremiumState = GetPremiumState
  {
  }
  deriving (Eq)

instance Show GetPremiumState where
  show GetPremiumState =
    "GetPremiumState"
      ++ U.cc
        []

instance T.ToJSON GetPremiumState where
  toJSON GetPremiumState =
    A.object
      [ "@type" A..= T.String "getPremiumState"
      ]
