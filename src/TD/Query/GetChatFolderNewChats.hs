module TD.Query.GetChatFolderNewChats
  (GetChatFolderNewChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns new chats added to a shareable chat folder by its owner. The method must be called at most once in getOption("chat_folder_new_chats_update_period") for the given chat folder. Returns 'TD.Data.Chats.Chats'
data GetChatFolderNewChats
  = GetChatFolderNewChats
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatFolderNewChats where
  shortShow
    GetChatFolderNewChats
      { chat_folder_id = chat_folder_id_
      }
        = "GetChatFolderNewChats"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          ]

instance AT.ToJSON GetChatFolderNewChats where
  toJSON
    GetChatFolderNewChats
      { chat_folder_id = chat_folder_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getChatFolderNewChats"
          , "chat_folder_id" A..= chat_folder_id_
          ]

