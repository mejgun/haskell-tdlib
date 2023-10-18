module TD.Query.RemoveFavoriteSticker
  (RemoveFavoriteSticker(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Removes a sticker from the list of favorite stickers. Returns 'TD.Data.Ok.Ok'
data RemoveFavoriteSticker
  = RemoveFavoriteSticker
    { sticker :: Maybe InputFile.InputFile -- ^ Sticker file to delete from the list
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveFavoriteSticker where
  shortShow
    RemoveFavoriteSticker
      { sticker = sticker_
      }
        = "RemoveFavoriteSticker"
          ++ I.cc
          [ "sticker" `I.p` sticker_
          ]

instance AT.ToJSON RemoveFavoriteSticker where
  toJSON
    RemoveFavoriteSticker
      { sticker = sticker_
      }
        = A.object
          [ "@type"   A..= AT.String "removeFavoriteSticker"
          , "sticker" A..= sticker_
          ]

