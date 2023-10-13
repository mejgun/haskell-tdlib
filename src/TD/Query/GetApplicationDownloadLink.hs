module TD.Query.GetApplicationDownloadLink
  (GetApplicationDownloadLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetApplicationDownloadLink -- ^ Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram
  = GetApplicationDownloadLink
  deriving (Eq)

instance Show GetApplicationDownloadLink where
  show
    GetApplicationDownloadLink
        = "GetApplicationDownloadLink"

instance AT.ToJSON GetApplicationDownloadLink where
  toJSON
    GetApplicationDownloadLink
        = A.object
          [ "@type" A..= AT.String "getApplicationDownloadLink"
          ]

