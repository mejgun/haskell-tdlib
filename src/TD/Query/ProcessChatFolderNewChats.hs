module TD.Query.ProcessChatFolderNewChats
  (ProcessChatFolderNewChats(..)
  , defaultProcessChatFolderNewChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Process new chats added to a shareable chat folder by its owner. Returns 'TD.Data.Ok.Ok'
data ProcessChatFolderNewChats
  = ProcessChatFolderNewChats
    { chat_folder_id :: Maybe Int   -- ^ Chat folder identifier
    , added_chat_ids :: Maybe [Int] -- ^ Identifiers of the new chats, which are added to the chat folder. The chats are automatically joined if they aren't joined yet
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessChatFolderNewChats where
  shortShow
    ProcessChatFolderNewChats
      { chat_folder_id = chat_folder_id_
      , added_chat_ids = added_chat_ids_
      }
        = "ProcessChatFolderNewChats"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          , "added_chat_ids" `I.p` added_chat_ids_
          ]

instance AT.ToJSON ProcessChatFolderNewChats where
  toJSON
    ProcessChatFolderNewChats
      { chat_folder_id = chat_folder_id_
      , added_chat_ids = added_chat_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "processChatFolderNewChats"
          , "chat_folder_id" A..= chat_folder_id_
          , "added_chat_ids" A..= added_chat_ids_
          ]

defaultProcessChatFolderNewChats :: ProcessChatFolderNewChats
defaultProcessChatFolderNewChats =
  ProcessChatFolderNewChats
    { chat_folder_id = Nothing
    , added_chat_ids = Nothing
    }

