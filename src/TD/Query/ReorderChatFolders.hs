module TD.Query.ReorderChatFolders
  (ReorderChatFolders(..)
  , defaultReorderChatFolders
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the order of chat folders. Returns 'TD.Data.Ok.Ok'
data ReorderChatFolders
  = ReorderChatFolders
    { chat_folder_ids         :: Maybe [Int] -- ^ Identifiers of chat folders in the new correct order
    , main_chat_list_position :: Maybe Int   -- ^ Position of the main chat list among chat folders, 0-based. Can be non-zero only for Premium users
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderChatFolders where
  shortShow
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

defaultReorderChatFolders :: ReorderChatFolders
defaultReorderChatFolders =
  ReorderChatFolders
    { chat_folder_ids         = Nothing
    , main_chat_list_position = Nothing
    }

