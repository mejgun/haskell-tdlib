module TD.Query.GetChatAdministrators where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatAdministrators -- ^ Returns a list of administrators of the chat with their custom titles
  = GetChatAdministrators
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetChatAdministrators where
  show
    GetChatAdministrators
      { chat_id = chat_id_
      }
        = "GetChatAdministrators"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatAdministrators where
  toJSON
    GetChatAdministrators
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatAdministrators"
          , "chat_id" A..= chat_id_
          ]
