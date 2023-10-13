module TD.Query.GetStickerEmojis(GetStickerEmojis(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

data GetStickerEmojis -- ^ Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
  = GetStickerEmojis
    { sticker :: Maybe InputFile.InputFile -- ^ Sticker file identifier
    }
  deriving (Eq)

instance Show GetStickerEmojis where
  show
    GetStickerEmojis
      { sticker = sticker_
      }
        = "GetStickerEmojis"
          ++ I.cc
          [ "sticker" `I.p` sticker_
          ]

instance AT.ToJSON GetStickerEmojis where
  toJSON
    GetStickerEmojis
      { sticker = sticker_
      }
        = A.object
          [ "@type"   A..= AT.String "getStickerEmojis"
          , "sticker" A..= sticker_
          ]
