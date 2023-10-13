module TD.Query.ReadChatList
  (ReadChatList(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList

data ReadChatList -- ^ Traverse all chats in a chat list and marks all messages in the chats as read
  = ReadChatList
    { chat_list :: Maybe ChatList.ChatList -- ^ Chat list in which to mark all chats as read
    }
  deriving (Eq)

instance Show ReadChatList where
  show
    ReadChatList
      { chat_list = chat_list_
      }
        = "ReadChatList"
          ++ I.cc
          [ "chat_list" `I.p` chat_list_
          ]

instance AT.ToJSON ReadChatList where
  toJSON
    ReadChatList
      { chat_list = chat_list_
      }
        = A.object
          [ "@type"     A..= AT.String "readChatList"
          , "chat_list" A..= chat_list_
          ]

