module TD.Query.DeleteAllChatWelcomeMessages
  (DeleteAllChatWelcomeMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat. Returns 'TD.Data.Ok.Ok'
data DeleteAllChatWelcomeMessages
  = DeleteAllChatWelcomeMessages
    { chat_id :: Maybe Int -- ^ The identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteAllChatWelcomeMessages where
  shortShow
    DeleteAllChatWelcomeMessages
      { chat_id = chat_id_
      }
        = "DeleteAllChatWelcomeMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON DeleteAllChatWelcomeMessages where
  toJSON
    DeleteAllChatWelcomeMessages
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "deleteAllChatWelcomeMessages"
          , "chat_id" A..= chat_id_
          ]

