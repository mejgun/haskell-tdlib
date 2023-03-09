{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetCustomEmojiStickerSetThumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets a custom emoji sticker set thumbnail; for bots only
data SetCustomEmojiStickerSetThumbnail = SetCustomEmojiStickerSetThumbnail
  { -- | Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail
    custom_emoji_id :: Maybe Int,
    -- | Sticker set name
    name :: Maybe String
  }
  deriving (Eq)

instance Show SetCustomEmojiStickerSetThumbnail where
  show
    SetCustomEmojiStickerSetThumbnail
      { custom_emoji_id = custom_emoji_id_,
        name = name_
      } =
      "SetCustomEmojiStickerSetThumbnail"
        ++ U.cc
          [ U.p "custom_emoji_id" custom_emoji_id_,
            U.p "name" name_
          ]

instance T.ToJSON SetCustomEmojiStickerSetThumbnail where
  toJSON
    SetCustomEmojiStickerSetThumbnail
      { custom_emoji_id = custom_emoji_id_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "setCustomEmojiStickerSetThumbnail",
          "custom_emoji_id" A..= U.toS custom_emoji_id_,
          "name" A..= name_
        ]
