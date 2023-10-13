module TD.Query.AddLocalMessage(AddLocalMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.MessageReplyTo as MessageReplyTo
import qualified TD.Data.InputMessageContent as InputMessageContent

data AddLocalMessage -- ^ Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
  = AddLocalMessage
    { chat_id               :: Maybe Int                                     -- ^ Target chat
    , sender_id             :: Maybe MessageSender.MessageSender             -- ^ Identifier of the sender of the message
    , reply_to              :: Maybe MessageReplyTo.MessageReplyTo           -- ^ Identifier of the replied message or story; pass null if none
    , disable_notification  :: Maybe Bool                                    -- ^ Pass true to disable notification for the message
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be added
    }
  deriving (Eq)

instance Show AddLocalMessage where
  show
    AddLocalMessage
      { chat_id               = chat_id_
      , sender_id             = sender_id_
      , reply_to              = reply_to_
      , disable_notification  = disable_notification_
      , input_message_content = input_message_content_
      }
        = "AddLocalMessage"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "sender_id"             `I.p` sender_id_
          , "reply_to"              `I.p` reply_to_
          , "disable_notification"  `I.p` disable_notification_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON AddLocalMessage where
  toJSON
    AddLocalMessage
      { chat_id               = chat_id_
      , sender_id             = sender_id_
      , reply_to              = reply_to_
      , disable_notification  = disable_notification_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "addLocalMessage"
          , "chat_id"               A..= chat_id_
          , "sender_id"             A..= sender_id_
          , "reply_to"              A..= reply_to_
          , "disable_notification"  A..= disable_notification_
          , "input_message_content" A..= input_message_content_
          ]
