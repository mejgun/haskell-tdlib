module TD.Query.DeleteMessages
  (DeleteMessages(..)
  , defaultDeleteMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data DeleteMessages -- ^ Deletes messages
  = DeleteMessages
    { chat_id     :: Maybe Int   -- ^ Chat identifier
    , message_ids :: Maybe [Int] -- ^ Identifiers of the messages to be deleted
    , revoke      :: Maybe Bool  -- ^ Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats
    }
  deriving (Eq)

instance Show DeleteMessages where
  show
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

