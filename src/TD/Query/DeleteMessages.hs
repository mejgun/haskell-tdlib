module TD.Query.DeleteMessages
  (DeleteMessages(..)
  , defaultDeleteMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes messages. Returns 'TD.Data.Ok.Ok'
data DeleteMessages
  = DeleteMessages
    { chat_id     :: Maybe Int   -- ^ Chat identifier
    , message_ids :: Maybe [Int] -- ^ Identifiers of the messages to be deleted. Use messageProperties.can_be_deleted_only_for_self and messageProperties.can_be_deleted_for_all_users to get suitable messages
    , revoke      :: Maybe Bool  -- ^ Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteMessages where
  shortShow
    DeleteMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      , revoke      = revoke_
      }
        = "DeleteMessages"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "message_ids" `I.p` message_ids_
          , "revoke"      `I.p` revoke_
          ]

instance AT.ToJSON DeleteMessages where
  toJSON
    DeleteMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      , revoke      = revoke_
      }
        = A.object
          [ "@type"       A..= AT.String "deleteMessages"
          , "chat_id"     A..= chat_id_
          , "message_ids" A..= message_ids_
          , "revoke"      A..= revoke_
          ]

defaultDeleteMessages :: DeleteMessages
defaultDeleteMessages =
  DeleteMessages
    { chat_id     = Nothing
    , message_ids = Nothing
    , revoke      = Nothing
    }

