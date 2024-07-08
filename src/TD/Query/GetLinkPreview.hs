module TD.Query.GetLinkPreview
  (GetLinkPreview(..)
  , defaultGetLinkPreview
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.LinkPreviewOptions as LinkPreviewOptions

-- | Returns a link preview by the text of a message. Do not call this function too often. Returns a 404 error if the text has no link preview. Returns 'TD.Data.LinkPreview.LinkPreview'
data GetLinkPreview
  = GetLinkPreview
    { text                 :: Maybe FormattedText.FormattedText           -- ^ Message text with formatting
    , link_preview_options :: Maybe LinkPreviewOptions.LinkPreviewOptions -- ^ Options to be used for generation of the link preview; pass null to use default link preview options
    }
  deriving (Eq, Show)

instance I.ShortShow GetLinkPreview where
  shortShow
    GetLinkPreview
      { text                 = text_
      , link_preview_options = link_preview_options_
      }
        = "GetLinkPreview"
          ++ I.cc
          [ "text"                 `I.p` text_
          , "link_preview_options" `I.p` link_preview_options_
          ]

instance AT.ToJSON GetLinkPreview where
  toJSON
    GetLinkPreview
      { text                 = text_
      , link_preview_options = link_preview_options_
      }
        = A.object
          [ "@type"                A..= AT.String "getLinkPreview"
          , "text"                 A..= text_
          , "link_preview_options" A..= link_preview_options_
          ]

defaultGetLinkPreview :: GetLinkPreview
defaultGetLinkPreview =
  GetLinkPreview
    { text                 = Nothing
    , link_preview_options = Nothing
    }

