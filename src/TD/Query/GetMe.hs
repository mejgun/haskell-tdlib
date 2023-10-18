module TD.Query.GetMe
  (GetMe(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the current user. Returns 'TD.Data.User.User'
data GetMe
  = GetMe
  deriving (Eq, Show)

instance I.ShortShow GetMe where
  shortShow
    GetMe
        = "GetMe"

instance AT.ToJSON GetMe where
  toJSON
    GetMe
        = A.object
          [ "@type" A..= AT.String "getMe"
          ]

