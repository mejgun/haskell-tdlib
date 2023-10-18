module TD.Query.GetUserLink
  (GetUserLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an HTTPS link, which can be used to get information about the current user. Returns 'TD.Data.UserLink.UserLink'
data GetUserLink
  = GetUserLink
  deriving (Eq, Show)

instance I.ShortShow GetUserLink where
  shortShow
    GetUserLink
        = "GetUserLink"

instance AT.ToJSON GetUserLink where
  toJSON
    GetUserLink
        = A.object
          [ "@type" A..= AT.String "getUserLink"
          ]

