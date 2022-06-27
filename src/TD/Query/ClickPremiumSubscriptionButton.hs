{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClickPremiumSubscriptionButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that the user clicked Premium subscription button on the Premium features screen
data ClickPremiumSubscriptionButton = ClickPremiumSubscriptionButton
  {
  }
  deriving (Eq)

instance Show ClickPremiumSubscriptionButton where
  show ClickPremiumSubscriptionButton =
    "ClickPremiumSubscriptionButton"
      ++ U.cc
        []

instance T.ToJSON ClickPremiumSubscriptionButton where
  toJSON ClickPremiumSubscriptionButton =
    A.object
      [ "@type" A..= T.String "clickPremiumSubscriptionButton"
      ]
