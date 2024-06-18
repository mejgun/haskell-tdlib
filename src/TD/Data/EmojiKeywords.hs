module TD.Data.EmojiKeywords
  (EmojiKeywords(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiKeyword as EmojiKeyword

data EmojiKeywords
  = EmojiKeywords -- ^ Represents a list of emojis with their keywords
    { emoji_keywords :: Maybe [EmojiKeyword.EmojiKeyword] -- ^ List of emojis with their keywords
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiKeywords where
  shortShow EmojiKeywords
    { emoji_keywords = emoji_keywords_
    }
      = "EmojiKeywords"
        ++ I.cc
        [ "emoji_keywords" `I.p` emoji_keywords_
        ]

instance AT.FromJSON EmojiKeywords where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiKeywords" -> parseEmojiKeywords v
      _               -> mempty
    
    where
      parseEmojiKeywords :: A.Value -> AT.Parser EmojiKeywords
      parseEmojiKeywords = A.withObject "EmojiKeywords" $ \o -> do
        emoji_keywords_ <- o A..:?  "emoji_keywords"
        pure $ EmojiKeywords
          { emoji_keywords = emoji_keywords_
          }
  parseJSON _ = mempty

