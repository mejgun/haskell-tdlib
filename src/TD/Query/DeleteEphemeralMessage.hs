module TD.Query.DeleteEphemeralMessage
  (DeleteEphemeralMessage(..)
  , defaultDeleteEphemeralMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes an ephemeral message; for bots only. Returns 'TD.Data.Ok.Ok'
data DeleteEphemeralMessage
  = DeleteEphemeralMessage
    { chat_id              :: Maybe Int -- ^ Chat identifier
    , receiver_user_id     :: Maybe Int -- ^ Identifier of the user who received the message
    , ephemeral_message_id :: Maybe Int -- ^ Identifier of the message to be deleted
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteEphemeralMessage where
  shortShow
    DeleteEphemeralMessage
      { chat_id              = chat_id_
      , receiver_user_id     = receiver_user_id_
      , ephemeral_message_id = ephemeral_message_id_
      }
        = "DeleteEphemeralMessage"
          ++ I.cc
          [ "chat_id"              `I.p` chat_id_
          , "receiver_user_id"     `I.p` receiver_user_id_
          , "ephemeral_message_id" `I.p` ephemeral_message_id_
          ]

instance AT.ToJSON DeleteEphemeralMessage where
  toJSON
    DeleteEphemeralMessage
      { chat_id              = chat_id_
      , receiver_user_id     = receiver_user_id_
      , ephemeral_message_id = ephemeral_message_id_
      }
        = A.object
          [ "@type"                A..= AT.String "deleteEphemeralMessage"
          , "chat_id"              A..= chat_id_
          , "receiver_user_id"     A..= receiver_user_id_
          , "ephemeral_message_id" A..= ephemeral_message_id_
          ]

defaultDeleteEphemeralMessage :: DeleteEphemeralMessage
defaultDeleteEphemeralMessage =
  DeleteEphemeralMessage
    { chat_id              = Nothing
    , receiver_user_id     = Nothing
    , ephemeral_message_id = Nothing
    }

