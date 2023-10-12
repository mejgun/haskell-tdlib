module TD.Query.GetChatMessageByDate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatMessageByDate -- ^ Returns the last message sent in a chat no later than the specified date
  = GetChatMessageByDate
    { chat_id :: Maybe Int -- ^ Chat identifier
    , date    :: Maybe Int -- ^ Point in time (Unix timestamp) relative to which to search for messages
    }
  deriving (Eq)

instance Show GetChatMessageByDate where
  show
    GetChatMessageByDate
      { chat_id = chat_id_
      , date    = date_
      }
        = "GetChatMessageByDate"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "date"    `I.p` date_
          ]

instance AT.ToJSON GetChatMessageByDate where
  toJSON
    GetChatMessageByDate
      { chat_id = chat_id_
      , date    = date_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatMessageByDate"
          , "chat_id" A..= chat_id_
          , "date"    A..= date_
          ]
