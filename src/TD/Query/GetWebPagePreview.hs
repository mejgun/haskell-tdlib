module TD.Query.GetWebPagePreview
  (GetWebPagePreview(..)
  , defaultGetWebPagePreview
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.LinkPreviewOptions as LinkPreviewOptions

-- | Returns a link preview by the text of a message. Do not call this function too often. Returns a 404 error if the text has no link preview. Returns 'TD.Data.WebPage.WebPage'
data GetWebPagePreview
  = GetWebPagePreview
    { text                 :: Maybe FormattedText.FormattedText           -- ^ Message text with formatting
    , link_preview_options :: Maybe LinkPreviewOptions.LinkPreviewOptions -- ^ Options to be used for generation of the link preview; pass null to use default link preview options
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebPagePreview where
  shortShow
    GetWebPagePreview
      { text                 = text_
      , link_preview_options = link_preview_options_
      }
        = "GetWebPagePreview"
          ++ I.cc
          [ "text"                 `I.p` text_
          , "link_preview_options" `I.p` link_preview_options_
          ]

instance AT.ToJSON GetWebPagePreview where
  toJSON
    GetWebPagePreview
      { text                 = text_
      , link_preview_options = link_preview_options_
      }
        = A.object
          [ "@type"                A..= AT.String "getWebPagePreview"
          , "text"                 A..= text_
          , "link_preview_options" A..= link_preview_options_
          ]

defaultGetWebPagePreview :: GetWebPagePreview
defaultGetWebPagePreview =
  GetWebPagePreview
    { text                 = Nothing
    , link_preview_options = Nothing
    }

