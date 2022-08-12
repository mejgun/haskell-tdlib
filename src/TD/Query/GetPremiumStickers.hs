{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPremiumStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns premium stickers from regular sticker sets @limit The maximum number of stickers to be returned; 0-100
data GetPremiumStickers = GetPremiumStickers
  { -- |
    limit :: Maybe Int
  }
  deriving (Eq)

instance Show GetPremiumStickers where
  show
    GetPremiumStickers
      { limit = limit_
      } =
      "GetPremiumStickers"
        ++ U.cc
          [ U.p "limit" limit_
          ]

instance T.ToJSON GetPremiumStickers where
  toJSON
    GetPremiumStickers
      { limit = limit_
      } =
      A.object
        [ "@type" A..= T.String "getPremiumStickers",
          "limit" A..= limit_
        ]
