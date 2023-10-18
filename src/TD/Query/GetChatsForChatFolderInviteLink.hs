module TD.Query.GetChatsForChatFolderInviteLink
  (GetChatsForChatFolderInviteLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns identifiers of chats from a chat folder, suitable for adding to a chat folder invite link. Returns 'TD.Data.Chats.Chats'
data GetChatsForChatFolderInviteLink
  = GetChatsForChatFolderInviteLink
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatsForChatFolderInviteLink where
  shortShow
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

