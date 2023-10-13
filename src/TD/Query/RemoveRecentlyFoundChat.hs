module TD.Query.RemoveRecentlyFoundChat
  (RemoveRecentlyFoundChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data RemoveRecentlyFoundChat -- ^ Removes a chat from the list of recently found chats
  = RemoveRecentlyFoundChat
    { chat_id :: Maybe Int -- ^ Identifier of the chat to be removed
    }
  deriving (Eq)

instance Show RemoveRecentlyFoundChat where
  show
    RemoveRecentlyFoundChat
      { chat_id = chat_id_
      }
        = "RemoveRecentlyFoundChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON RemoveRecentlyFoundChat where
  toJSON
    RemoveRecentlyFoundChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "removeRecentlyFoundChat"
          , "chat_id" A..= chat_id_
          ]

