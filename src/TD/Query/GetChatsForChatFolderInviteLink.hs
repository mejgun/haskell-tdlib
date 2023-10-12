module TD.Query.GetChatsForChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatsForChatFolderInviteLink -- ^ Returns identifiers of chats from a chat folder, suitable for adding to a chat folder invite link
  = GetChatsForChatFolderInviteLink
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq)

instance Show GetChatsForChatFolderInviteLink where
  show
    GetChatsForChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      }
        = "GetChatsForChatFolderInviteLink"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          ]

instance AT.ToJSON GetChatsForChatFolderInviteLink where
  toJSON
    GetChatsForChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getChatsForChatFolderInviteLink"
          , "chat_folder_id" A..= chat_folder_id_
          ]
