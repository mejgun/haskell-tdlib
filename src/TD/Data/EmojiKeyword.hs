module TD.Data.EmojiKeyword
  (EmojiKeyword(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data EmojiKeyword
  = EmojiKeyword -- ^ Represents an emoji with its keyword
    { emoji   :: Maybe T.Text -- ^ The emoji
    , keyword :: Maybe T.Text -- ^ The keyword
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiKeyword where
  shortShow EmojiKeyword
    { emoji   = emoji_
    , keyword = keyword_
    }
      = "EmojiKeyword"
        ++ I.cc
        [ "emoji"   `I.p` emoji_
        , "keyword" `I.p` keyword_
        ]

instance AT.FromJSON EmojiKeyword where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiKeyword" -> parseEmojiKeyword v
      _              -> mempty
    
    where
      parseEmojiKeyword :: A.Value -> AT.Parser EmojiKeyword
      parseEmojiKeyword = A.withObject "EmojiKeyword" $ \o -> do
        emoji_   <- o A..:?  "emoji"
        keyword_ <- o A..:?  "keyword"
        pure $ EmojiKeyword
          { emoji   = emoji_
          , keyword = keyword_
          }
  parseJSON _ = mempty

