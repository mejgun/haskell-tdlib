module TD.Query.GetInactiveSupergroupChats
  (GetInactiveSupergroupChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on the number of joined supergroups and channels and receives CHANNELS_TOO_MUCH error. Also, the limit can be increased with Telegram Premium. Returns 'TD.Data.Chats.Chats'
data GetInactiveSupergroupChats
  = GetInactiveSupergroupChats
  deriving (Eq, Show)

instance I.ShortShow GetInactiveSupergroupChats where
  shortShow
    GetInactiveSupergroupChats
        = "GetInactiveSupergroupChats"

instance AT.ToJSON GetInactiveSupergroupChats where
  toJSON
    GetInactiveSupergroupChats
        = A.object
          [ "@type" A..= AT.String "getInactiveSupergroupChats"
          ]

