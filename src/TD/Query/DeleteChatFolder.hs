module TD.Query.DeleteChatFolder
  (DeleteChatFolder(..)
  , defaultDeleteChatFolder
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes existing chat folder. Returns 'TD.Data.Ok.Ok'
data DeleteChatFolder
  = DeleteChatFolder
    { chat_folder_id :: Maybe Int   -- ^ Chat folder identifier
    , leave_chat_ids :: Maybe [Int] -- ^ Identifiers of the chats to leave. The chats must be pinned or always included in the folder
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteChatFolder where
  shortShow
    DeleteChatFolder
      { chat_folder_id = chat_folder_id_
      , leave_chat_ids = leave_chat_ids_
      }
        = "DeleteChatFolder"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          , "leave_chat_ids" `I.p` leave_chat_ids_
          ]

instance AT.ToJSON DeleteChatFolder where
  toJSON
    DeleteChatFolder
      { chat_folder_id = chat_folder_id_
      , leave_chat_ids = leave_chat_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "deleteChatFolder"
          , "chat_folder_id" A..= chat_folder_id_
          , "leave_chat_ids" A..= leave_chat_ids_
          ]

defaultDeleteChatFolder :: DeleteChatFolder
defaultDeleteChatFolder =
  DeleteChatFolder
    { chat_folder_id = Nothing
    , leave_chat_ids = Nothing
    }

