module TD.Data.EmojiStatus
  ( EmojiStatus(..)    
  , defaultEmojiStatus 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data EmojiStatus
  = EmojiStatus -- ^ Describes a custom emoji to be shown instead of the Telegram Premium badge
    { custom_emoji_id :: Maybe Int -- ^ Identifier of the custom emoji in stickerFormatTgs format
    , expiration_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the status will expire; 0 if never
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiStatus where
  shortShow EmojiStatus
    { custom_emoji_id = custom_emoji_id_
    , expiration_date = expiration_date_
    }
      = "EmojiStatus"
        ++ I.cc
        [ "custom_emoji_id" `I.p` custom_emoji_id_
        , "expiration_date" `I.p` expiration_date_
        ]

instance AT.FromJSON EmojiStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiStatus" -> parseEmojiStatus v
      _             -> mempty
    
    where
      parseEmojiStatus :: A.Value -> AT.Parser EmojiStatus
      parseEmojiStatus = A.withObject "EmojiStatus" $ \o -> do
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        expiration_date_ <- o A..:?                       "expiration_date"
        pure $ EmojiStatus
          { custom_emoji_id = custom_emoji_id_
          , expiration_date = expiration_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON EmojiStatus where
  toJSON EmojiStatus
    { custom_emoji_id = custom_emoji_id_
    , expiration_date = expiration_date_
    }
      = A.object
        [ "@type"           A..= AT.String "emojiStatus"
        , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
        , "expiration_date" A..= expiration_date_
        ]

defaultEmojiStatus :: EmojiStatus
defaultEmojiStatus =
  EmojiStatus
    { custom_emoji_id = Nothing
    , expiration_date = Nothing
    }

