module TD.Query.GetChatAdministrators
  (GetChatAdministrators(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of administrators of the chat with their custom titles. Returns 'TD.Data.ChatAdministrators.ChatAdministrators'
data GetChatAdministrators
  = GetChatAdministrators
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatAdministrators where
  shortShow
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

