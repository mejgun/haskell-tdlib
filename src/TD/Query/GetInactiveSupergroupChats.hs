module TD.Query.GetInactiveSupergroupChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetInactiveSupergroupChats -- ^ Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on the number of joined supergroups and channels and receives CHANNELS_TOO_MUCH error. Also, the limit can be increased with Telegram Premium
  = GetInactiveSupergroupChats
  deriving (Eq)

instance Show GetInactiveSupergroupChats where
  show
    GetInactiveSupergroupChats
        = "GetInactiveSupergroupChats"

instance AT.ToJSON GetInactiveSupergroupChats where
  toJSON
    GetInactiveSupergroupChats
        = A.object
          [ "@type" A..= AT.String "getInactiveSupergroupChats"
          ]
