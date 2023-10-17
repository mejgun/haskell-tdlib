module TD.Query.GetWebPagePreview
  (GetWebPagePreview(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview
data GetWebPagePreview
  = GetWebPagePreview
    { text :: Maybe FormattedText.FormattedText -- ^ Message text with formatting
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebPagePreview where
  shortShow
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

