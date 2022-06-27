{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CanPurchasePremium where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether Telegram Premium purchase is possible. Must be called before in-store Premium purchase
data CanPurchasePremium = CanPurchasePremium
  {
  }
  deriving (Eq)

instance Show CanPurchasePremium where
  show CanPurchasePremium =
    "CanPurchasePremium"
      ++ U.cc
        []

instance T.ToJSON CanPurchasePremium where
  toJSON CanPurchasePremium =
    A.object
      [ "@type" A..= T.String "canPurchasePremium"
      ]
