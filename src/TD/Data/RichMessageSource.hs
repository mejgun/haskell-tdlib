module TD.Data.RichMessageSource
  (RichMessageSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes source of a rich message
data RichMessageSource
  = RichMessageSourceMarkdown -- ^ A Markdown-formatted rich message; for bots only
    { text :: Maybe T.Text -- ^ Markdown-formatted text of the message
    }
  | RichMessageSourceHtml -- ^ An HTML-formatted rich message; for bots only
    { text :: Maybe T.Text -- ^ HTML-formatted text of the message
    }
  deriving (Eq, Show)

instance I.ShortShow RichMessageSource where
  shortShow RichMessageSourceMarkdown
    { text = text_
    }
      = "RichMessageSourceMarkdown"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow RichMessageSourceHtml
    { text = text_
    }
      = "RichMessageSourceHtml"
        ++ I.cc
        [ "text" `I.p` text_
        ]

instance AT.FromJSON RichMessageSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "richMessageSourceMarkdown" -> parseRichMessageSourceMarkdown v
      "richMessageSourceHtml"     -> parseRichMessageSourceHtml v
      _                           -> mempty
    
    where
      parseRichMessageSourceMarkdown :: A.Value -> AT.Parser RichMessageSource
      parseRichMessageSourceMarkdown = A.withObject "RichMessageSourceMarkdown" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ RichMessageSourceMarkdown
          { text = text_
          }
      parseRichMessageSourceHtml :: A.Value -> AT.Parser RichMessageSource
      parseRichMessageSourceHtml = A.withObject "RichMessageSourceHtml" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ RichMessageSourceHtml
          { text = text_
          }
  parseJSON _ = mempty

instance AT.ToJSON RichMessageSource where
  toJSON RichMessageSourceMarkdown
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "richMessageSourceMarkdown"
        , "text"  A..= text_
        ]
  toJSON RichMessageSourceHtml
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "richMessageSourceHtml"
        , "text"  A..= text_
        ]

