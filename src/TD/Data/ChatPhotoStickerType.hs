{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatPhotoStickerType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes type of a sticker, which was used to create a chat photo
data ChatPhotoStickerType
  = -- | Information about the sticker, which was used to create the chat photo
    ChatPhotoStickerTypeRegularOrMask
      { -- | Identifier of the sticker in the set
        sticker_id :: Maybe Int,
        -- | Sticker set identifier
        sticker_set_id :: Maybe Int
      }
  | -- | Information about the custom emoji, which was used to create the chat photo
    ChatPhotoStickerTypeCustomEmoji
      { -- | Identifier of the custom emoji
        custom_emoji_id :: Maybe Int
      }
  deriving (Eq)

instance Show ChatPhotoStickerType where
  show
    ChatPhotoStickerTypeRegularOrMask
      { sticker_id = sticker_id_,
        sticker_set_id = sticker_set_id_
      } =
      "ChatPhotoStickerTypeRegularOrMask"
        ++ U.cc
          [ U.p "sticker_id" sticker_id_,
            U.p "sticker_set_id" sticker_set_id_
          ]
  show
    ChatPhotoStickerTypeCustomEmoji
      { custom_emoji_id = custom_emoji_id_
      } =
      "ChatPhotoStickerTypeCustomEmoji"
        ++ U.cc
          [ U.p "custom_emoji_id" custom_emoji_id_
          ]

instance T.FromJSON ChatPhotoStickerType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPhotoStickerTypeRegularOrMask" -> parseChatPhotoStickerTypeRegularOrMask v
      "chatPhotoStickerTypeCustomEmoji" -> parseChatPhotoStickerTypeCustomEmoji v
      _ -> mempty
    where
      parseChatPhotoStickerTypeRegularOrMask :: A.Value -> T.Parser ChatPhotoStickerType
      parseChatPhotoStickerTypeRegularOrMask = A.withObject "ChatPhotoStickerTypeRegularOrMask" $ \o -> do
        sticker_id_ <- U.rm <$> (o A..:? "sticker_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        sticker_set_id_ <- U.rm <$> (o A..:? "sticker_set_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ ChatPhotoStickerTypeRegularOrMask {sticker_id = sticker_id_, sticker_set_id = sticker_set_id_}

      parseChatPhotoStickerTypeCustomEmoji :: A.Value -> T.Parser ChatPhotoStickerType
      parseChatPhotoStickerTypeCustomEmoji = A.withObject "ChatPhotoStickerTypeCustomEmoji" $ \o -> do
        custom_emoji_id_ <- U.rm <$> (o A..:? "custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ ChatPhotoStickerTypeCustomEmoji {custom_emoji_id = custom_emoji_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatPhotoStickerType where
  toJSON
    ChatPhotoStickerTypeRegularOrMask
      { sticker_id = sticker_id_,
        sticker_set_id = sticker_set_id_
      } =
      A.object
        [ "@type" A..= T.String "chatPhotoStickerTypeRegularOrMask",
          "sticker_id" A..= U.toS sticker_id_,
          "sticker_set_id" A..= U.toS sticker_set_id_
        ]
  toJSON
    ChatPhotoStickerTypeCustomEmoji
      { custom_emoji_id = custom_emoji_id_
      } =
      A.object
        [ "@type" A..= T.String "chatPhotoStickerTypeCustomEmoji",
          "custom_emoji_id" A..= U.toS custom_emoji_id_
        ]
