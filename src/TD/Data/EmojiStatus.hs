{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data EmojiStatus = -- | Describes a custom emoji to be shown instead of the Telegram Premium badge @custom_emoji_id Identifier of the custom emoji in stickerFormatTgs format. If the custom emoji belongs to the sticker set getOption("themed_emoji_statuses_sticker_set_id"), then it's color must be changed to the color of the Telegram Premium badge
  EmojiStatus
  { -- |
    custom_emoji_id :: Maybe Int
  }
  deriving (Eq)

instance Show EmojiStatus where
  show
    EmojiStatus
      { custom_emoji_id = custom_emoji_id_
      } =
      "EmojiStatus"
        ++ U.cc
          [ U.p "custom_emoji_id" custom_emoji_id_
          ]

instance T.FromJSON EmojiStatus where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emojiStatus" -> parseEmojiStatus v
      _ -> mempty
    where
      parseEmojiStatus :: A.Value -> T.Parser EmojiStatus
      parseEmojiStatus = A.withObject "EmojiStatus" $ \o -> do
        custom_emoji_id_ <- U.rm <$> (o A..:? "custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ EmojiStatus {custom_emoji_id = custom_emoji_id_}
  parseJSON _ = mempty

instance T.ToJSON EmojiStatus where
  toJSON
    EmojiStatus
      { custom_emoji_id = custom_emoji_id_
      } =
      A.object
        [ "@type" A..= T.String "emojiStatus",
          "custom_emoji_id" A..= U.toS custom_emoji_id_
        ]
