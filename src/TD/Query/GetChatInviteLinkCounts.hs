module TD.Query.GetChatInviteLinkCounts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatInviteLinkCounts -- ^ Returns list of chat administrators with number of their invite links. Requires owner privileges in the chat
  = GetChatInviteLinkCounts
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetChatInviteLinkCounts where
  show
    GetChatInviteLinkCounts
      { chat_id = chat_id_
      }
        = "GetChatInviteLinkCounts"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatInviteLinkCounts where
  toJSON
    GetChatInviteLinkCounts
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatInviteLinkCounts"
          , "chat_id" A..= chat_id_
          ]
