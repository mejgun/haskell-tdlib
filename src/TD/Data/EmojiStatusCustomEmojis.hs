module TD.Data.EmojiStatusCustomEmojis
  (EmojiStatusCustomEmojis(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data EmojiStatusCustomEmojis
  = EmojiStatusCustomEmojis -- ^ Contains a list of custom emoji identifiers for emoji statuses
    { custom_emoji_ids :: Maybe [Int] -- ^ The list of custom emoji identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiStatusCustomEmojis where
  shortShow EmojiStatusCustomEmojis
    { custom_emoji_ids = custom_emoji_ids_
    }
      = "EmojiStatusCustomEmojis"
        ++ I.cc
        [ "custom_emoji_ids" `I.p` custom_emoji_ids_
        ]

instance AT.FromJSON EmojiStatusCustomEmojis where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiStatusCustomEmojis" -> parseEmojiStatusCustomEmojis v
      _                         -> mempty
    
    where
      parseEmojiStatusCustomEmojis :: A.Value -> AT.Parser EmojiStatusCustomEmojis
      parseEmojiStatusCustomEmojis = A.withObject "EmojiStatusCustomEmojis" $ \o -> do
        custom_emoji_ids_ <- fmap (fmap I.readInt64) <$> o A..:?  "custom_emoji_ids"
        pure $ EmojiStatusCustomEmojis
          { custom_emoji_ids = custom_emoji_ids_
          }
  parseJSON _ = mempty

