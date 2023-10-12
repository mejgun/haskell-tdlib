module TD.Query.ReorderChatFolders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ReorderChatFolders -- ^ Changes the order of chat folders
  = ReorderChatFolders
    { chat_folder_ids         :: Maybe [Int] -- ^ Identifiers of chat folders in the new correct order
    , main_chat_list_position :: Maybe Int   -- ^ Position of the main chat list among chat folders, 0-based. Can be non-zero only for Premium users
    }
  deriving (Eq)

instance Show ReorderChatFolders where
  show
    ReorderChatFolders
      { chat_folder_ids         = chat_folder_ids_
      , main_chat_list_position = main_chat_list_position_
      }
        = "ReorderChatFolders"
          ++ I.cc
          [ "chat_folder_ids"         `I.p` chat_folder_ids_
          , "main_chat_list_position" `I.p` main_chat_list_position_
          ]

instance AT.ToJSON ReorderChatFolders where
  toJSON
    ReorderChatFolders
      { chat_folder_ids         = chat_folder_ids_
      , main_chat_list_position = main_chat_list_position_
      }
        = A.object
          [ "@type"                   A..= AT.String "reorderChatFolders"
          , "chat_folder_ids"         A..= chat_folder_ids_
          , "main_chat_list_position" A..= main_chat_list_position_
          ]
