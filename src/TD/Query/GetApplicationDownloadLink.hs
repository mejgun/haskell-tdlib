module TD.Query.GetApplicationDownloadLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
