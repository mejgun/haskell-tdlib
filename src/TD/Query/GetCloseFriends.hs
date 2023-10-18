module TD.Query.GetCloseFriends
  (GetCloseFriends(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all close friends of the current user. Returns 'TD.Data.Users.Users'
data GetCloseFriends
  = GetCloseFriends
  deriving (Eq, Show)

instance I.ShortShow GetCloseFriends where
  shortShow
    GetCloseFriends
        = "GetCloseFriends"

instance AT.ToJSON GetCloseFriends where
  toJSON
    GetCloseFriends
        = A.object
          [ "@type" A..= AT.String "getCloseFriends"
          ]

