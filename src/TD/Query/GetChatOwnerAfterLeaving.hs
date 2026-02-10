module TD.Query.GetChatOwnerAfterLeaving
  (GetChatOwnerAfterLeaving(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the user who will become the owner of the chat after 7 days if the current user does not return to the chat during that period; requires owner privileges in the chat. Available only for supergroups and channel chats. Returns 'TD.Data.User.User'
data GetChatOwnerAfterLeaving
  = GetChatOwnerAfterLeaving
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatOwnerAfterLeaving where
  shortShow
    GetChatOwnerAfterLeaving
      { chat_id = chat_id_
      }
        = "GetChatOwnerAfterLeaving"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatOwnerAfterLeaving where
  toJSON
    GetChatOwnerAfterLeaving
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatOwnerAfterLeaving"
          , "chat_id" A..= chat_id_
          ]

