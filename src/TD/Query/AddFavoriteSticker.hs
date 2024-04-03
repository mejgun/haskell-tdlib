module TD.Query.AddFavoriteSticker
  (AddFavoriteSticker(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to favorite stickers. Returns 'TD.Data.Ok.Ok'
data AddFavoriteSticker
  = AddFavoriteSticker
    { sticker :: Maybe InputFile.InputFile -- ^ Sticker file to add
    }
  deriving (Eq, Show)

instance I.ShortShow AddFavoriteSticker where
  shortShow
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

