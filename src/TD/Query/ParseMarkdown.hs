module TD.Query.ParseMarkdown
  (ParseMarkdown(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously. Returns 'TD.Data.FormattedText.FormattedText'
data ParseMarkdown
  = ParseMarkdown
    { text :: Maybe FormattedText.FormattedText -- ^ The text to parse. For example, "__italic__ ~~strikethrough~~ ||spoiler|| **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
    }
  deriving (Eq, Show)

instance I.ShortShow ParseMarkdown where
  shortShow
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

