module TD.Query.AddFavoriteSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

data AddFavoriteSticker -- ^ Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list. Emoji stickers can't be added to favorite stickers
  = AddFavoriteSticker
    { sticker :: Maybe InputFile.InputFile -- ^ Sticker file to add
    }
  deriving (Eq)

instance Show AddFavoriteSticker where
  show
    AddFavoriteSticker
      { sticker = sticker_
      }
        = "AddFavoriteSticker"
          ++ I.cc
          [ "sticker" `I.p` sticker_
          ]

instance AT.ToJSON AddFavoriteSticker where
  toJSON
    AddFavoriteSticker
      { sticker = sticker_
      }
        = A.object
          [ "@type"   A..= AT.String "addFavoriteSticker"
          , "sticker" A..= sticker_
          ]
