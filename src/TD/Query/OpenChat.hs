module TD.Query.OpenChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data OpenChat -- ^ Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats)
  = OpenChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show OpenChat where
  show
    OpenChat
      { chat_id = chat_id_
      }
        = "OpenChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON OpenChat where
  toJSON
    OpenChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "openChat"
          , "chat_id" A..= chat_id_
          ]
