module TD.Query.GetRecentlyOpenedChats
  (GetRecentlyOpenedChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns recently opened chats; this is an offline request. Returns chats in the order of last opening. Returns 'TD.Data.Chats.Chats'
data GetRecentlyOpenedChats
  = GetRecentlyOpenedChats
    { limit :: Maybe Int -- ^ The maximum number of chats to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow GetRecentlyOpenedChats where
  shortShow
    GetRecentlyOpenedChats
      { limit = limit_
      }
        = "GetRecentlyOpenedChats"
          ++ I.cc
          [ "limit" `I.p` limit_
          ]

instance AT.ToJSON GetRecentlyOpenedChats where
  toJSON
    GetRecentlyOpenedChats
      { limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "getRecentlyOpenedChats"
          , "limit" A..= limit_
          ]

