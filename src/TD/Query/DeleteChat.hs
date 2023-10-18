module TD.Query.DeleteChat
  (DeleteChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a chat along with all messages in the corresponding chat for all chat members. For group chats this will release the usernames and remove all members. Use the field chat.can_be_deleted_for_all_users to find whether the method can be applied to the chat. Returns 'TD.Data.Ok.Ok'
data DeleteChat
  = DeleteChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteChat where
  shortShow
    DeleteChat
      { chat_id = chat_id_
      }
        = "DeleteChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON DeleteChat where
  toJSON
    DeleteChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "deleteChat"
          , "chat_id" A..= chat_id_
          ]

