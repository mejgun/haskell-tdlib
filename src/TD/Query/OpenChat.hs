module TD.Query.OpenChat
  (OpenChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats). Returns 'TD.Data.Ok.Ok'
data OpenChat
  = OpenChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow OpenChat where
  shortShow
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

