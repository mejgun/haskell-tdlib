module TD.Query.GetUserLink
  (GetUserLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns an HTTPS link, which can be used to get information about the current user
data GetUserLink
  = GetUserLink
  deriving (Eq)

instance Show GetUserLink where
  show
    GetUserLink
        = "GetUserLink"

instance AT.ToJSON GetUserLink where
  toJSON
    GetUserLink
        = A.object
          [ "@type" A..= AT.String "getUserLink"
          ]

