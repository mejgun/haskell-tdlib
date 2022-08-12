{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPremiumStickerExamples where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns examples of premium stickers for demonstration purposes
data GetPremiumStickerExamples = GetPremiumStickerExamples
  {
  }
  deriving (Eq)

instance Show GetPremiumStickerExamples where
  show GetPremiumStickerExamples =
    "GetPremiumStickerExamples"
      ++ U.cc
        []

instance T.ToJSON GetPremiumStickerExamples where
  toJSON GetPremiumStickerExamples =
    A.object
      [ "@type" A..= T.String "getPremiumStickerExamples"
      ]
