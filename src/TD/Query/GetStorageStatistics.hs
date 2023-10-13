module TD.Query.GetStorageStatistics(GetStorageStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetStorageStatistics -- ^ Returns storage usage statistics. Can be called before authorization
  = GetStorageStatistics
    { chat_limit :: Maybe Int -- ^ The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
    }
  deriving (Eq)

instance Show GetStorageStatistics where
  show
    GetStorageStatistics
      { chat_limit = chat_limit_
      }
        = "GetStorageStatistics"
          ++ I.cc
          [ "chat_limit" `I.p` chat_limit_
          ]

instance AT.ToJSON GetStorageStatistics where
  toJSON
    GetStorageStatistics
      { chat_limit = chat_limit_
      }
        = A.object
          [ "@type"      A..= AT.String "getStorageStatistics"
          , "chat_limit" A..= chat_limit_
          ]
