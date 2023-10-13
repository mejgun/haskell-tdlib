module TD.Query.GetWebPagePreview(GetWebPagePreview(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data GetWebPagePreview -- ^ Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview
  = GetWebPagePreview
    { text :: Maybe FormattedText.FormattedText -- ^ Message text with formatting
    }
  deriving (Eq)

instance Show GetWebPagePreview where
  show
    GetWebPagePreview
      { text = text_
      }
        = "GetWebPagePreview"
          ++ I.cc
          [ "text" `I.p` text_
          ]

instance AT.ToJSON GetWebPagePreview where
  toJSON
    GetWebPagePreview
      { text = text_
      }
        = A.object
          [ "@type" A..= AT.String "getWebPagePreview"
          , "text"  A..= text_
          ]
