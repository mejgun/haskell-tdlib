module TD.Query.GetInstalledStickerSets
  (GetInstalledStickerSets(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType

-- | Returns a list of installed sticker sets. Returns 'TD.Data.StickerSets.StickerSets'
data GetInstalledStickerSets
  = GetInstalledStickerSets
    { sticker_type :: Maybe StickerType.StickerType -- ^ Type of the sticker sets to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetInstalledStickerSets where
  shortShow
    GetInstalledStickerSets
      { sticker_type = sticker_type_
      }
        = "GetInstalledStickerSets"
          ++ I.cc
          [ "sticker_type" `I.p` sticker_type_
          ]

instance AT.ToJSON GetInstalledStickerSets where
  toJSON
    GetInstalledStickerSets
      { sticker_type = sticker_type_
      }
        = A.object
          [ "@type"        A..= AT.String "getInstalledStickerSets"
          , "sticker_type" A..= sticker_type_
          ]

