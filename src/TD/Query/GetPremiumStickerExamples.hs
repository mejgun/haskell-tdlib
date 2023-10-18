module TD.Query.GetPremiumStickerExamples
  (GetPremiumStickerExamples(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns examples of premium stickers for demonstration purposes. Returns 'TD.Data.Stickers.Stickers'
data GetPremiumStickerExamples
  = GetPremiumStickerExamples
  deriving (Eq, Show)

instance I.ShortShow GetPremiumStickerExamples where
  shortShow
    GetPremiumStickerExamples
        = "GetPremiumStickerExamples"

instance AT.ToJSON GetPremiumStickerExamples where
  toJSON
    GetPremiumStickerExamples
        = A.object
          [ "@type" A..= AT.String "getPremiumStickerExamples"
          ]

