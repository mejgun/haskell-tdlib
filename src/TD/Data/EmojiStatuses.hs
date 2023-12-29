module TD.Data.EmojiStatuses
  (EmojiStatuses(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data EmojiStatuses
  = EmojiStatuses -- ^ Contains a list of custom emoji identifiers for emoji statuses
    { custom_emoji_ids :: Maybe [Int] -- ^ The list of custom emoji identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiStatuses where
  shortShow EmojiStatuses
    { custom_emoji_ids = custom_emoji_ids_
    }
      = "EmojiStatuses"
        ++ I.cc
        [ "custom_emoji_ids" `I.p` custom_emoji_ids_
        ]

instance AT.FromJSON EmojiStatuses where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiStatuses" -> parseEmojiStatuses v
      _               -> mempty
    
    where
      parseEmojiStatuses :: A.Value -> AT.Parser EmojiStatuses
      parseEmojiStatuses = A.withObject "EmojiStatuses" $ \o -> do
        custom_emoji_ids_ <- fmap (fmap I.readInt64) <$> o A..:?  "custom_emoji_ids"
        pure $ EmojiStatuses
          { custom_emoji_ids = custom_emoji_ids_
          }
  parseJSON _ = mempty

