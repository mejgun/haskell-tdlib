module TD.Query.JoinChat
  (JoinChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds the current user as a new member to a chat. Private and secret chats can't be joined using this method. May return an error with a message "INVITE_REQUEST_SENT" if only a join request was created. Returns 'TD.Data.Ok.Ok'
data JoinChat
  = JoinChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow JoinChat where
  shortShow
    JoinChat
      { chat_id = chat_id_
      }
        = "JoinChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON JoinChat where
  toJSON
    JoinChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "joinChat"
          , "chat_id" A..= chat_id_
          ]

