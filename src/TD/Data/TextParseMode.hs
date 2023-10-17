module TD.Data.TextParseMode
  (TextParseMode(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the way the text needs to be parsed for text entities
data TextParseMode
  = TextParseModeMarkdown -- ^ The text uses Markdown-style formatting
    { version :: Maybe Int -- ^ Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
    }
  | TextParseModeHTML -- ^ The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode
  deriving (Eq, Show)

instance I.ShortShow TextParseMode where
  shortShow TextParseModeMarkdown
    { version = version_
    }
      = "TextParseModeMarkdown"
        ++ I.cc
        [ "version" `I.p` version_
        ]
  shortShow TextParseModeHTML
      = "TextParseModeHTML"

instance AT.FromJSON TextParseMode where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textParseModeMarkdown" -> parseTextParseModeMarkdown v
      "textParseModeHTML"     -> pure TextParseModeHTML
      _                       -> mempty
    
    where
      parseTextParseModeMarkdown :: A.Value -> AT.Parser TextParseMode
      parseTextParseModeMarkdown = A.withObject "TextParseModeMarkdown" $ \o -> do
        version_ <- o A..:?  "version"
        pure $ TextParseModeMarkdown
          { version = version_
          }
  parseJSON _ = mempty

instance AT.ToJSON TextParseMode where
  toJSON TextParseModeMarkdown
    { version = version_
    }
      = A.object
        [ "@type"   A..= AT.String "textParseModeMarkdown"
        , "version" A..= version_
        ]
  toJSON TextParseModeHTML
      = A.object
        [ "@type" A..= AT.String "textParseModeHTML"
        ]

