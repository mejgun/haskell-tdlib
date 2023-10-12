module TD.Query.GetChatSponsoredMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatSponsoredMessages -- ^ Returns sponsored messages to be shown in a chat; for channel chats only
  = GetChatSponsoredMessages
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq)

instance Show GetChatSponsoredMessages where
  show
    GetChatSponsoredMessages
      { chat_id = chat_id_
      }
        = "GetChatSponsoredMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatSponsoredMessages where
  toJSON
    GetChatSponsoredMessages
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatSponsoredMessages"
          , "chat_id" A..= chat_id_
          ]
