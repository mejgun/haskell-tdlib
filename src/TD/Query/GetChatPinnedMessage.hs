module TD.Query.GetChatPinnedMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatPinnedMessage -- ^ Returns information about a newest pinned message in the chat
  = GetChatPinnedMessage
    { chat_id :: Maybe Int -- ^ Identifier of the chat the message belongs to
    }
  deriving (Eq)

instance Show GetChatPinnedMessage where
  show
    GetChatPinnedMessage
      { chat_id = chat_id_
      }
        = "GetChatPinnedMessage"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatPinnedMessage where
  toJSON
    GetChatPinnedMessage
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatPinnedMessage"
          , "chat_id" A..= chat_id_
          ]
