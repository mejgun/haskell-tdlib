module TD.Query.UnpinAllChatMessages
  (UnpinAllChatMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes all pinned messages from a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel. Returns 'TD.Data.Ok.Ok'
data UnpinAllChatMessages
  = UnpinAllChatMessages
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow UnpinAllChatMessages where
  shortShow
    UnpinAllChatMessages
      { chat_id = chat_id_
      }
        = "UnpinAllChatMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON UnpinAllChatMessages where
  toJSON
    UnpinAllChatMessages
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "unpinAllChatMessages"
          , "chat_id" A..= chat_id_
          ]

