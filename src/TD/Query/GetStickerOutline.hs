module TD.Query.GetStickerOutline
  (GetStickerOutline(..)
  , defaultGetStickerOutline
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns outline of a sticker; this is an offline request. Returns a 404 error if the outline isn't known. Returns 'TD.Data.Outline.Outline'
data GetStickerOutline
  = GetStickerOutline
    { sticker_file_id                    :: Maybe Int  -- ^ File identifier of the sticker
    , for_animated_emoji                 :: Maybe Bool -- ^ Pass true to get the outline scaled for animated emoji
    , for_clicked_animated_emoji_message :: Maybe Bool -- ^ Pass true to get the outline scaled for clicked animated emoji message
    }
  deriving (Eq, Show)

instance I.ShortShow GetStickerOutline where
  shortShow
    GetStickerOutline
      { sticker_file_id                    = sticker_file_id_
      , for_animated_emoji                 = for_animated_emoji_
      , for_clicked_animated_emoji_message = for_clicked_animated_emoji_message_
      }
        = "GetStickerOutline"
          ++ I.cc
          [ "sticker_file_id"                    `I.p` sticker_file_id_
          , "for_animated_emoji"                 `I.p` for_animated_emoji_
          , "for_clicked_animated_emoji_message" `I.p` for_clicked_animated_emoji_message_
          ]

instance AT.ToJSON GetStickerOutline where
  toJSON
    GetStickerOutline
      { sticker_file_id                    = sticker_file_id_
      , for_animated_emoji                 = for_animated_emoji_
      , for_clicked_animated_emoji_message = for_clicked_animated_emoji_message_
      }
        = A.object
          [ "@type"                              A..= AT.String "getStickerOutline"
          , "sticker_file_id"                    A..= sticker_file_id_
          , "for_animated_emoji"                 A..= for_animated_emoji_
          , "for_clicked_animated_emoji_message" A..= for_clicked_animated_emoji_message_
          ]

defaultGetStickerOutline :: GetStickerOutline
defaultGetStickerOutline =
  GetStickerOutline
    { sticker_file_id                    = Nothing
    , for_animated_emoji                 = Nothing
    , for_clicked_animated_emoji_message = Nothing
    }

