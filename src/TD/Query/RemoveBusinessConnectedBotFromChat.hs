module TD.Query.RemoveBusinessConnectedBotFromChat
  (RemoveBusinessConnectedBotFromChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes the connected business bot from a specific chat by adding the chat to businessRecipients.excluded_chat_ids. Returns 'TD.Data.Ok.Ok'
data RemoveBusinessConnectedBotFromChat
  = RemoveBusinessConnectedBotFromChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveBusinessConnectedBotFromChat where
  shortShow
    RemoveBusinessConnectedBotFromChat
      { chat_id = chat_id_
      }
        = "RemoveBusinessConnectedBotFromChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON RemoveBusinessConnectedBotFromChat where
  toJSON
    RemoveBusinessConnectedBotFromChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "removeBusinessConnectedBotFromChat"
          , "chat_id" A..= chat_id_
          ]

