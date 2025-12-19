module TD.Query.GetStickerOutlineSvgPath
  (GetStickerOutlineSvgPath(..)
  , defaultGetStickerOutlineSvgPath
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns outline of a sticker as an SVG path. This is an offline method. Returns an empty string if the outline isn't known. Returns 'TD.Data.Text.Text'
data GetStickerOutlineSvgPath
  = GetStickerOutlineSvgPath
    { sticker_file_id                    :: Maybe Int  -- ^ File identifier of the sticker
    , for_animated_emoji                 :: Maybe Bool -- ^ Pass true to get the outline scaled for animated emoji
    , for_clicked_animated_emoji_message :: Maybe Bool -- ^ Pass true to get the outline scaled for clicked animated emoji message
    }
  deriving (Eq, Show)

instance I.ShortShow GetStickerOutlineSvgPath where
  shortShow
    GetStickerOutlineSvgPath
      { sticker_file_id                    = sticker_file_id_
      , for_animated_emoji                 = for_animated_emoji_
      , for_clicked_animated_emoji_message = for_clicked_animated_emoji_message_
      }
        = "GetStickerOutlineSvgPath"
          ++ I.cc
          [ "sticker_file_id"                    `I.p` sticker_file_id_
          , "for_animated_emoji"                 `I.p` for_animated_emoji_
          , "for_clicked_animated_emoji_message" `I.p` for_clicked_animated_emoji_message_
          ]

instance AT.ToJSON GetStickerOutlineSvgPath where
  toJSON
    GetStickerOutlineSvgPath
      { sticker_file_id                    = sticker_file_id_
      , for_animated_emoji                 = for_animated_emoji_
      , for_clicked_animated_emoji_message = for_clicked_animated_emoji_message_
      }
        = A.object
          [ "@type"                              A..= AT.String "getStickerOutlineSvgPath"
          , "sticker_file_id"                    A..= sticker_file_id_
          , "for_animated_emoji"                 A..= for_animated_emoji_
          , "for_clicked_animated_emoji_message" A..= for_clicked_animated_emoji_message_
          ]

defaultGetStickerOutlineSvgPath :: GetStickerOutlineSvgPath
defaultGetStickerOutlineSvgPath =
  GetStickerOutlineSvgPath
    { sticker_file_id                    = Nothing
    , for_animated_emoji                 = Nothing
    , for_clicked_animated_emoji_message = Nothing
    }

