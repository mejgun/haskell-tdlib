module TD.Query.GetCloseFriends where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetCloseFriends -- ^ Returns all close friends of the current user
  = GetCloseFriends
  deriving (Eq)

instance Show GetCloseFriends where
  show
    GetCloseFriends
        = "GetCloseFriends"

instance AT.ToJSON GetCloseFriends where
  toJSON
    GetCloseFriends
        = A.object
          [ "@type" A..= AT.String "getCloseFriends"
          ]
