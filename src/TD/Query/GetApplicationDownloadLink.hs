module TD.Query.GetApplicationDownloadLink
  (GetApplicationDownloadLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetApplicationDownloadLink
  = GetApplicationDownloadLink
  deriving (Eq, Show)

instance I.ShortShow GetApplicationDownloadLink where
  shortShow
    GetApplicationDownloadLink
        = "GetApplicationDownloadLink"

instance AT.ToJSON GetApplicationDownloadLink where
  toJSON
    GetApplicationDownloadLink
        = A.object
          [ "@type" A..= AT.String "getApplicationDownloadLink"
          ]

