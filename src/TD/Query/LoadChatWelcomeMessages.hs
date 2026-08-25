module TD.Query.LoadChatWelcomeMessages
  (LoadChatWelcomeMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat. The loaded messages will be sent through updateChatWelcomeMessages. Returns 'TD.Data.Ok.Ok'
data LoadChatWelcomeMessages
  = LoadChatWelcomeMessages
    { chat_id :: Maybe Int -- ^ The identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow LoadChatWelcomeMessages where
  shortShow
    LoadChatWelcomeMessages
      { chat_id = chat_id_
      }
        = "LoadChatWelcomeMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON LoadChatWelcomeMessages where
  toJSON
    LoadChatWelcomeMessages
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "loadChatWelcomeMessages"
          , "chat_id" A..= chat_id_
          ]

