module TD.Query.UnpinAllChatMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data UnpinAllChatMessages -- ^ Removes all pinned messages from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel
  = UnpinAllChatMessages
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq)

instance Show UnpinAllChatMessages where
  show
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
