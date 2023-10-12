module TD.Query.ParseMarkdown where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data ParseMarkdown -- ^ Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
  = ParseMarkdown
    { text :: Maybe FormattedText.FormattedText -- ^ The text to parse. For example, "__italic__ ~~strikethrough~~ ||spoiler|| **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
    }
  deriving (Eq)

instance Show ParseMarkdown where
  show
    ParseMarkdown
      { text = text_
      }
        = "ParseMarkdown"
          ++ I.cc
          [ "text" `I.p` text_
          ]

instance AT.ToJSON ParseMarkdown where
  toJSON
    ParseMarkdown
      { text = text_
      }
        = A.object
          [ "@type" A..= AT.String "parseMarkdown"
          , "text"  A..= text_
          ]
