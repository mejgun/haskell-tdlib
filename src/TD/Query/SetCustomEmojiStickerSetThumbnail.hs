module TD.Query.SetCustomEmojiStickerSetThumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetCustomEmojiStickerSetThumbnail -- ^ Sets a custom emoji sticker set thumbnail; for bots only
  = SetCustomEmojiStickerSetThumbnail
    { name            :: Maybe T.Text -- ^ Sticker set name
    , custom_emoji_id :: Maybe Int    -- ^ Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail
    }
  deriving (Eq)

instance Show SetCustomEmojiStickerSetThumbnail where
  show
    SetCustomEmojiStickerSetThumbnail
      { name            = name_
      , custom_emoji_id = custom_emoji_id_
      }
        = "SetCustomEmojiStickerSetThumbnail"
          ++ I.cc
          [ "name"            `I.p` name_
          , "custom_emoji_id" `I.p` custom_emoji_id_
          ]

instance AT.ToJSON SetCustomEmojiStickerSetThumbnail where
  toJSON
    SetCustomEmojiStickerSetThumbnail
      { name            = name_
      , custom_emoji_id = custom_emoji_id_
      }
        = A.object
          [ "@type"           A..= AT.String "setCustomEmojiStickerSetThumbnail"
          , "name"            A..= name_
          , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
          ]
