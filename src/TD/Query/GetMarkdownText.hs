module TD.Query.GetMarkdownText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data GetMarkdownText -- ^ Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously
  = GetMarkdownText
    { text :: Maybe FormattedText.FormattedText -- ^ The text
    }
  deriving (Eq)

instance Show GetMarkdownText where
  show
    GetMarkdownText
      { text = text_
      }
        = "GetMarkdownText"
          ++ I.cc
          [ "text" `I.p` text_
          ]

instance AT.ToJSON GetMarkdownText where
  toJSON
    GetMarkdownText
      { text = text_
      }
        = A.object
          [ "@type" A..= AT.String "getMarkdownText"
          , "text"  A..= text_
          ]
