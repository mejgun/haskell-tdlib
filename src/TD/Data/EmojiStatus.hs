{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data EmojiStatus = -- | Describes a custom emoji to be shown instead of the Telegram Premium badge
  EmojiStatus
  { -- | Point in time (Unix timestamp) when the status will expire; 0 if never
    expiration_date :: Maybe Int,
    -- | Identifier of the custom emoji in stickerFormatTgs format
    custom_emoji_id :: Maybe Int
  }
  deriving (Eq)

instance Show EmojiStatus where
  show
    EmojiStatus
      { expiration_date = expiration_date_,
        custom_emoji_id = custom_emoji_id_
      } =
      "EmojiStatus"
        ++ U.cc
          [ U.p "expiration_date" expiration_date_,
            U.p "custom_emoji_id" custom_emoji_id_
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
        expiration_date_ <- o A..:? "expiration_date"
        custom_emoji_id_ <- U.rm <$> (o A..:? "custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ EmojiStatus {expiration_date = expiration_date_, custom_emoji_id = custom_emoji_id_}
  parseJSON _ = mempty

instance T.ToJSON EmojiStatus where
  toJSON
    EmojiStatus
      { expiration_date = expiration_date_,
        custom_emoji_id = custom_emoji_id_
      } =
      A.object
        [ "@type" A..= T.String "emojiStatus",
          "expiration_date" A..= expiration_date_,
          "custom_emoji_id" A..= U.toS custom_emoji_id_
        ]
