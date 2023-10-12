module TD.Query.GetChatFolderChatsToLeave where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatFolderChatsToLeave -- ^ Returns identifiers of pinned or always included chats from a chat folder, which are suggested to be left when the chat folder is deleted
  = GetChatFolderChatsToLeave
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq)

instance Show GetChatFolderChatsToLeave where
  show
    GetChatFolderChatsToLeave
      { chat_folder_id = chat_folder_id_
      }
        = "GetChatFolderChatsToLeave"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          ]

instance AT.ToJSON GetChatFolderChatsToLeave where
  toJSON
    GetChatFolderChatsToLeave
      { chat_folder_id = chat_folder_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getChatFolderChatsToLeave"
          , "chat_folder_id" A..= chat_folder_id_
          ]
