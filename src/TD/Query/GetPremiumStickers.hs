{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPremiumStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns examples of premium stickers for demonstration purposes
data GetPremiumStickers = GetPremiumStickers
  {
  }
  deriving (Eq)

instance Show GetPremiumStickers where
  show GetPremiumStickers =
    "GetPremiumStickers"
      ++ U.cc
        []

instance T.ToJSON GetPremiumStickers where
  toJSON GetPremiumStickers =
    A.object
      [ "@type" A..= T.String "getPremiumStickers"
      ]
