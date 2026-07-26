module TD.Data.RichMessageSource
  (RichMessageSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputPageBlock as InputPageBlock
import qualified Data.Text as T
import {-# SOURCE #-} qualified TD.Data.InputRichMessageMedia as InputRichMessageMedia

-- | Describes source of a rich message
data RichMessageSource
  = RichMessageSourceBlocks -- ^ A rich message defined by blocks
    { blocks :: Maybe [InputPageBlock.InputPageBlock] -- ^ Content of the message
    }
  | RichMessageSourceMarkdown -- ^ A Markdown-formatted rich message; for bots only
    { text  :: Maybe T.Text                                        -- ^ Markdown-formatted text of the message
    , media :: Maybe [InputRichMessageMedia.InputRichMessageMedia] -- ^ Media used in the message
    }
  | RichMessageSourceHtml -- ^ An HTML-formatted rich message; for bots only
    { text  :: Maybe T.Text                                        -- ^ HTML-formatted text of the message
    , media :: Maybe [InputRichMessageMedia.InputRichMessageMedia] -- ^ Media used in the message
    }
  deriving (Eq, Show)

instance I.ShortShow RichMessageSource where
  shortShow RichMessageSourceBlocks
    { blocks = blocks_
    }
      = "RichMessageSourceBlocks"
        ++ I.cc
        [ "blocks" `I.p` blocks_
        ]
  shortShow RichMessageSourceMarkdown
    { text  = text_
    , media = media_
    }
      = "RichMessageSourceMarkdown"
        ++ I.cc
        [ "text"  `I.p` text_
        , "media" `I.p` media_
        ]
  shortShow RichMessageSourceHtml
    { text  = text_
    , media = media_
    }
      = "RichMessageSourceHtml"
        ++ I.cc
        [ "text"  `I.p` text_
        , "media" `I.p` media_
        ]

instance AT.FromJSON RichMessageSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "richMessageSourceBlocks"   -> parseRichMessageSourceBlocks v
      "richMessageSourceMarkdown" -> parseRichMessageSourceMarkdown v
      "richMessageSourceHtml"     -> parseRichMessageSourceHtml v
      _                           -> mempty
    
    where
      parseRichMessageSourceBlocks :: A.Value -> AT.Parser RichMessageSource
      parseRichMessageSourceBlocks = A.withObject "RichMessageSourceBlocks" $ \o -> do
        blocks_ <- o A..:?  "blocks"
        pure $ RichMessageSourceBlocks
          { blocks = blocks_
          }
      parseRichMessageSourceMarkdown :: A.Value -> AT.Parser RichMessageSource
      parseRichMessageSourceMarkdown = A.withObject "RichMessageSourceMarkdown" $ \o -> do
        text_  <- o A..:?  "text"
        media_ <- o A..:?  "media"
        pure $ RichMessageSourceMarkdown
          { text  = text_
          , media = media_
          }
      parseRichMessageSourceHtml :: A.Value -> AT.Parser RichMessageSource
      parseRichMessageSourceHtml = A.withObject "RichMessageSourceHtml" $ \o -> do
        text_  <- o A..:?  "text"
        media_ <- o A..:?  "media"
        pure $ RichMessageSourceHtml
          { text  = text_
          , media = media_
          }
  parseJSON _ = mempty

instance AT.ToJSON RichMessageSource where
  toJSON RichMessageSourceBlocks
    { blocks = blocks_
    }
      = A.object
        [ "@type"  A..= AT.String "richMessageSourceBlocks"
        , "blocks" A..= blocks_
        ]
  toJSON RichMessageSourceMarkdown
    { text  = text_
    , media = media_
    }
      = A.object
        [ "@type" A..= AT.String "richMessageSourceMarkdown"
        , "text"  A..= text_
        , "media" A..= media_
        ]
  toJSON RichMessageSourceHtml
    { text  = text_
    , media = media_
    }
      = A.object
        [ "@type" A..= AT.String "richMessageSourceHtml"
        , "text"  A..= text_
        , "media" A..= media_
        ]

