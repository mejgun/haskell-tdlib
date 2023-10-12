module TD.Query.GetPremiumStickerExamples where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetPremiumStickerExamples -- ^ Returns examples of premium stickers for demonstration purposes
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
