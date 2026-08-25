module TD.Query.DeleteChatWelcomeMessage
  (DeleteChatWelcomeMessage(..)
  , defaultDeleteChatWelcomeMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a welcome message of a chat; requires can_send_welcome_messages administrator right in the chat. Returns 'TD.Data.Ok.Ok'
data DeleteChatWelcomeMessage
  = DeleteChatWelcomeMessage
    { chat_id            :: Maybe Int -- ^ The identifier of the chat
    , welcome_message_id :: Maybe Int -- ^ The identifier of the welcome message
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteChatWelcomeMessage where
  shortShow
    DeleteChatWelcomeMessage
      { chat_id            = chat_id_
      , welcome_message_id = welcome_message_id_
      }
        = "DeleteChatWelcomeMessage"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "welcome_message_id" `I.p` welcome_message_id_
          ]

instance AT.ToJSON DeleteChatWelcomeMessage where
  toJSON
    DeleteChatWelcomeMessage
      { chat_id            = chat_id_
      , welcome_message_id = welcome_message_id_
      }
        = A.object
          [ "@type"              A..= AT.String "deleteChatWelcomeMessage"
          , "chat_id"            A..= chat_id_
          , "welcome_message_id" A..= welcome_message_id_
          ]

defaultDeleteChatWelcomeMessage :: DeleteChatWelcomeMessage
defaultDeleteChatWelcomeMessage =
  DeleteChatWelcomeMessage
    { chat_id            = Nothing
    , welcome_message_id = Nothing
    }

