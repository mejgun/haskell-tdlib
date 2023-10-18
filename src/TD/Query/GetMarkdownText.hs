module TD.Query.GetMarkdownText
  (GetMarkdownText(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously. Returns 'TD.Data.FormattedText.FormattedText'
data GetMarkdownText
  = GetMarkdownText
    { text :: Maybe FormattedText.FormattedText -- ^ The text
    }
  deriving (Eq, Show)

instance I.ShortShow GetMarkdownText where
  shortShow
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

