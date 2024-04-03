module TD.Query.RemoveStickerFromSet
  (RemoveStickerFromSet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Removes a sticker from the set to which it belongs. The sticker set must be owned by the current user. Returns 'TD.Data.Ok.Ok'
data RemoveStickerFromSet
  = RemoveStickerFromSet
    { sticker :: Maybe InputFile.InputFile -- ^ Sticker to remove from the set
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveStickerFromSet where
  shortShow
    RemoveStickerFromSet
      { sticker = sticker_
      }
        = "RemoveStickerFromSet"
          ++ I.cc
          [ "sticker" `I.p` sticker_
          ]

instance AT.ToJSON RemoveStickerFromSet where
  toJSON
    RemoveStickerFromSet
      { sticker = sticker_
      }
        = A.object
          [ "@type"   A..= AT.String "removeStickerFromSet"
          , "sticker" A..= sticker_
          ]

