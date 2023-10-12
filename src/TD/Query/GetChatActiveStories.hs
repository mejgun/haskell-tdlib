module TD.Query.GetChatActiveStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatActiveStories -- ^ Returns the list of active stories posted by the given chat
  = GetChatActiveStories
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetChatActiveStories where
  show
    GetChatActiveStories
      { chat_id = chat_id_
      }
        = "GetChatActiveStories"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatActiveStories where
  toJSON
    GetChatActiveStories
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatActiveStories"
          , "chat_id" A..= chat_id_
          ]
