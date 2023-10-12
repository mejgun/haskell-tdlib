module TD.Query.GetChatListsToAddChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatListsToAddChat -- ^ Returns chat lists to which the chat can be added. This is an offline request
  = GetChatListsToAddChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetChatListsToAddChat where
  show
    GetChatListsToAddChat
      { chat_id = chat_id_
      }
        = "GetChatListsToAddChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatListsToAddChat where
  toJSON
    GetChatListsToAddChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatListsToAddChat"
          , "chat_id" A..= chat_id_
          ]
