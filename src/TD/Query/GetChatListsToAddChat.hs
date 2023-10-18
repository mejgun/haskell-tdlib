module TD.Query.GetChatListsToAddChat
  (GetChatListsToAddChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns chat lists to which the chat can be added. This is an offline request. Returns 'TD.Data.ChatLists.ChatLists'
data GetChatListsToAddChat
  = GetChatListsToAddChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatListsToAddChat where
  shortShow
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

