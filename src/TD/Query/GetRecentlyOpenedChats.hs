module TD.Query.GetRecentlyOpenedChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetRecentlyOpenedChats -- ^ Returns recently opened chats; this is an offline request. Returns chats in the order of last opening
  = GetRecentlyOpenedChats
    { limit :: Maybe Int -- ^ The maximum number of chats to be returned
    }
  deriving (Eq)

instance Show GetRecentlyOpenedChats where
  show
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
