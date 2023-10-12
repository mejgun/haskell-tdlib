module TD.Query.DeleteChatHistory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DeleteChatHistory -- ^ Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat
  = DeleteChatHistory
    { chat_id               :: Maybe Int  -- ^ Chat identifier
    , remove_from_chat_list :: Maybe Bool -- ^ Pass true to remove the chat from all chat lists
    , revoke                :: Maybe Bool -- ^ Pass true to delete chat history for all users
    }
  deriving (Eq)

instance Show DeleteChatHistory where
  show
    DeleteChatHistory
      { chat_id               = chat_id_
      , remove_from_chat_list = remove_from_chat_list_
      , revoke                = revoke_
      }
        = "DeleteChatHistory"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "remove_from_chat_list" `I.p` remove_from_chat_list_
          , "revoke"                `I.p` revoke_
          ]

instance AT.ToJSON DeleteChatHistory where
  toJSON
    DeleteChatHistory
      { chat_id               = chat_id_
      , remove_from_chat_list = remove_from_chat_list_
      , revoke                = revoke_
      }
        = A.object
          [ "@type"                 A..= AT.String "deleteChatHistory"
          , "chat_id"               A..= chat_id_
          , "remove_from_chat_list" A..= remove_from_chat_list_
          , "revoke"                A..= revoke_
          ]
