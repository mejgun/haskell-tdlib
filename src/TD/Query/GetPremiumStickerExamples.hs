module TD.Query.GetPremiumStickerExamples
  (GetPremiumStickerExamples(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns examples of premium stickers for demonstration purposes
data GetPremiumStickerExamples
  = GetPremiumStickerExamples
  deriving (Eq)

instance Show GetPremiumStickerExamples where
  show
    GetPremiumStickerExamples
        = "GetPremiumStickerExamples"

instance AT.ToJSON GetPremiumStickerExamples where
  toJSON
    GetPremiumStickerExamples
        = A.object
          [ "@type" A..= AT.String "getPremiumStickerExamples"
          ]

