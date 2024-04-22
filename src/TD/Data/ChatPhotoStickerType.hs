module TD.Data.ChatPhotoStickerType
  (ChatPhotoStickerType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of sticker, which was used to create a chat photo
data ChatPhotoStickerType
  = ChatPhotoStickerTypeRegularOrMask -- ^ Information about the sticker, which was used to create the chat photo
    { sticker_set_id :: Maybe Int -- ^ Sticker set identifier
    , sticker_id     :: Maybe Int -- ^ Identifier of the sticker in the set
    }
  | ChatPhotoStickerTypeCustomEmoji -- ^ Information about the custom emoji, which was used to create the chat photo
    { custom_emoji_id :: Maybe Int -- ^ Identifier of the custom emoji
    }
  deriving (Eq, Show)

instance I.ShortShow ChatPhotoStickerType where
  shortShow ChatPhotoStickerTypeRegularOrMask
    { sticker_set_id = sticker_set_id_
    , sticker_id     = sticker_id_
    }
      = "ChatPhotoStickerTypeRegularOrMask"
        ++ I.cc
        [ "sticker_set_id" `I.p` sticker_set_id_
        , "sticker_id"     `I.p` sticker_id_
        ]
  shortShow ChatPhotoStickerTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = "ChatPhotoStickerTypeCustomEmoji"
        ++ I.cc
        [ "custom_emoji_id" `I.p` custom_emoji_id_
        ]

instance AT.FromJSON ChatPhotoStickerType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatPhotoStickerTypeRegularOrMask" -> parseChatPhotoStickerTypeRegularOrMask v
      "chatPhotoStickerTypeCustomEmoji"   -> parseChatPhotoStickerTypeCustomEmoji v
      _                                   -> mempty
    
    where
      parseChatPhotoStickerTypeRegularOrMask :: A.Value -> AT.Parser ChatPhotoStickerType
      parseChatPhotoStickerTypeRegularOrMask = A.withObject "ChatPhotoStickerTypeRegularOrMask" $ \o -> do
        sticker_set_id_ <- fmap I.readInt64 <$> o A..:?  "sticker_set_id"
        sticker_id_     <- fmap I.readInt64 <$> o A..:?  "sticker_id"
        pure $ ChatPhotoStickerTypeRegularOrMask
          { sticker_set_id = sticker_set_id_
          , sticker_id     = sticker_id_
          }
      parseChatPhotoStickerTypeCustomEmoji :: A.Value -> AT.Parser ChatPhotoStickerType
      parseChatPhotoStickerTypeCustomEmoji = A.withObject "ChatPhotoStickerTypeCustomEmoji" $ \o -> do
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        pure $ ChatPhotoStickerTypeCustomEmoji
          { custom_emoji_id = custom_emoji_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatPhotoStickerType where
  toJSON ChatPhotoStickerTypeRegularOrMask
    { sticker_set_id = sticker_set_id_
    , sticker_id     = sticker_id_
    }
      = A.object
        [ "@type"          A..= AT.String "chatPhotoStickerTypeRegularOrMask"
        , "sticker_set_id" A..= fmap I.writeInt64  sticker_set_id_
        , "sticker_id"     A..= fmap I.writeInt64  sticker_id_
        ]
  toJSON ChatPhotoStickerTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = A.object
        [ "@type"           A..= AT.String "chatPhotoStickerTypeCustomEmoji"
        , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
        ]

