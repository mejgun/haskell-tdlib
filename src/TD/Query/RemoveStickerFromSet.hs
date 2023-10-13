module TD.Query.RemoveStickerFromSet(RemoveStickerFromSet(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

data RemoveStickerFromSet -- ^ Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot
  = RemoveStickerFromSet
    { sticker :: Maybe InputFile.InputFile -- ^ Sticker
    }
  deriving (Eq)

instance Show RemoveStickerFromSet where
  show
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
