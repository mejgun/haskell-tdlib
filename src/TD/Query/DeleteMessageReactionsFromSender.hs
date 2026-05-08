module TD.Query.DeleteMessageReactionsFromSender
  (DeleteMessageReactionsFromSender(..)
  , defaultDeleteMessageReactionsFromSender
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Deletes all reactions added by the specified sender on a message. Returns 'TD.Data.Ok.Ok'
data DeleteMessageReactionsFromSender
  = DeleteMessageReactionsFromSender
    { chat_id    :: Maybe Int                         -- ^ Chat identifier
    , message_id :: Maybe Int                         -- ^ Identifier of the message containing the reactions. Use messageProperties.can_delete_reactions to check whether the method can be used for a message
    , sender_id  :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender of reactions to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteMessageReactionsFromSender where
  shortShow
    DeleteMessageReactionsFromSender
      { chat_id    = chat_id_
      , message_id = message_id_
      , sender_id  = sender_id_
      }
        = "DeleteMessageReactionsFromSender"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "sender_id"  `I.p` sender_id_
          ]

instance AT.ToJSON DeleteMessageReactionsFromSender where
  toJSON
    DeleteMessageReactionsFromSender
      { chat_id    = chat_id_
      , message_id = message_id_
      , sender_id  = sender_id_
      }
        = A.object
          [ "@type"      A..= AT.String "deleteMessageReactionsFromSender"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "sender_id"  A..= sender_id_
          ]

defaultDeleteMessageReactionsFromSender :: DeleteMessageReactionsFromSender
defaultDeleteMessageReactionsFromSender =
  DeleteMessageReactionsFromSender
    { chat_id    = Nothing
    , message_id = Nothing
    , sender_id  = Nothing
    }

