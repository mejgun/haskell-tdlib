module TD.Query.AddRecentlyFoundChat
  (AddRecentlyFoundChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first. Returns 'TD.Data.Ok.Ok'
data AddRecentlyFoundChat
  = AddRecentlyFoundChat
    { chat_id :: Maybe Int -- ^ Identifier of the chat to add
    }
  deriving (Eq, Show)

instance I.ShortShow AddRecentlyFoundChat where
  shortShow
    AddRecentlyFoundChat
      { chat_id = chat_id_
      }
        = "AddRecentlyFoundChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON AddRecentlyFoundChat where
  toJSON
    AddRecentlyFoundChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "addRecentlyFoundChat"
          , "chat_id" A..= chat_id_
          ]

