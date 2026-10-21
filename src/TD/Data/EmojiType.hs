module TD.Data.EmojiType
  (EmojiType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes an emoji
data EmojiType
  = EmojiTypeRegular -- ^ A regular emoji
    { emoji :: Maybe T.Text -- ^ Text representation of the emoji
    }
  | EmojiTypeCustomEmoji -- ^ A custom emoji
    { custom_emoji_id :: Maybe Int -- ^ Identifier of the custom emoji
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiType where
  shortShow EmojiTypeRegular
    { emoji = emoji_
    }
      = "EmojiTypeRegular"
        ++ I.cc
        [ "emoji" `I.p` emoji_
        ]
  shortShow EmojiTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = "EmojiTypeCustomEmoji"
        ++ I.cc
        [ "custom_emoji_id" `I.p` custom_emoji_id_
        ]

instance AT.FromJSON EmojiType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiTypeRegular"     -> parseEmojiTypeRegular v
      "emojiTypeCustomEmoji" -> parseEmojiTypeCustomEmoji v
      _                      -> mempty
    
    where
      parseEmojiTypeRegular :: A.Value -> AT.Parser EmojiType
      parseEmojiTypeRegular = A.withObject "EmojiTypeRegular" $ \o -> do
        emoji_ <- o A..:?  "emoji"
        pure $ EmojiTypeRegular
          { emoji = emoji_
          }
      parseEmojiTypeCustomEmoji :: A.Value -> AT.Parser EmojiType
      parseEmojiTypeCustomEmoji = A.withObject "EmojiTypeCustomEmoji" $ \o -> do
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        pure $ EmojiTypeCustomEmoji
          { custom_emoji_id = custom_emoji_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON EmojiType where
  toJSON EmojiTypeRegular
    { emoji = emoji_
    }
      = A.object
        [ "@type" A..= AT.String "emojiTypeRegular"
        , "emoji" A..= emoji_
        ]
  toJSON EmojiTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = A.object
        [ "@type"           A..= AT.String "emojiTypeCustomEmoji"
        , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
        ]

