module TD.Query.DeleteAllRecentMessageReactionsFromSender
  (DeleteAllRecentMessageReactionsFromSender(..)
  , defaultDeleteAllRecentMessageReactionsFromSender
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Deletes all recent reactions added by the specified sender in a chat. Supported only for basic groups and supergroups; requires can_delete_messages administrator right. Returns 'TD.Data.Ok.Ok'
data DeleteAllRecentMessageReactionsFromSender
  = DeleteAllRecentMessageReactionsFromSender
    { chat_id   :: Maybe Int                         -- ^ Chat identifier
    , sender_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender of reactions to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteAllRecentMessageReactionsFromSender where
  shortShow
    DeleteAllRecentMessageReactionsFromSender
      { chat_id   = chat_id_
      , sender_id = sender_id_
      }
        = "DeleteAllRecentMessageReactionsFromSender"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "sender_id" `I.p` sender_id_
          ]

instance AT.ToJSON DeleteAllRecentMessageReactionsFromSender where
  toJSON
    DeleteAllRecentMessageReactionsFromSender
      { chat_id   = chat_id_
      , sender_id = sender_id_
      }
        = A.object
          [ "@type"     A..= AT.String "deleteAllRecentMessageReactionsFromSender"
          , "chat_id"   A..= chat_id_
          , "sender_id" A..= sender_id_
          ]

defaultDeleteAllRecentMessageReactionsFromSender :: DeleteAllRecentMessageReactionsFromSender
defaultDeleteAllRecentMessageReactionsFromSender =
  DeleteAllRecentMessageReactionsFromSender
    { chat_id   = Nothing
    , sender_id = Nothing
    }

