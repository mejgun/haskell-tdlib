module TD.Query.SetSupergroupCustomEmojiStickerSet
  (SetSupergroupCustomEmojiStickerSet(..)
  , defaultSetSupergroupCustomEmojiStickerSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the custom emoji sticker set of a supergroup; requires can_change_info administrator right. The chat must have at least chatBoostFeatures.min_custom_emoji_sticker_set_boost_level boost level to pass the corresponding color. Returns 'TD.Data.Ok.Ok'
data SetSupergroupCustomEmojiStickerSet
  = SetSupergroupCustomEmojiStickerSet
    { supergroup_id               :: Maybe Int -- ^ Identifier of the supergroup
    , custom_emoji_sticker_set_id :: Maybe Int -- ^ New value of the custom emoji sticker set identifier for the supergroup. Use 0 to remove the custom emoji sticker set in the supergroup
    }
  deriving (Eq, Show)

instance I.ShortShow SetSupergroupCustomEmojiStickerSet where
  shortShow
    SetSupergroupCustomEmojiStickerSet
      { supergroup_id               = supergroup_id_
      , custom_emoji_sticker_set_id = custom_emoji_sticker_set_id_
      }
        = "SetSupergroupCustomEmojiStickerSet"
          ++ I.cc
          [ "supergroup_id"               `I.p` supergroup_id_
          , "custom_emoji_sticker_set_id" `I.p` custom_emoji_sticker_set_id_
          ]

instance AT.ToJSON SetSupergroupCustomEmojiStickerSet where
  toJSON
    SetSupergroupCustomEmojiStickerSet
      { supergroup_id               = supergroup_id_
      , custom_emoji_sticker_set_id = custom_emoji_sticker_set_id_
      }
        = A.object
          [ "@type"                       A..= AT.String "setSupergroupCustomEmojiStickerSet"
          , "supergroup_id"               A..= supergroup_id_
          , "custom_emoji_sticker_set_id" A..= fmap I.writeInt64  custom_emoji_sticker_set_id_
          ]

defaultSetSupergroupCustomEmojiStickerSet :: SetSupergroupCustomEmojiStickerSet
defaultSetSupergroupCustomEmojiStickerSet =
  SetSupergroupCustomEmojiStickerSet
    { supergroup_id               = Nothing
    , custom_emoji_sticker_set_id = Nothing
    }

