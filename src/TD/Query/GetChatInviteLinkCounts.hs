module TD.Query.GetChatInviteLinkCounts
  (GetChatInviteLinkCounts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of chat administrators with number of their invite links. Requires owner privileges in the chat. Returns 'TD.Data.ChatInviteLinkCounts.ChatInviteLinkCounts'
data GetChatInviteLinkCounts
  = GetChatInviteLinkCounts
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatInviteLinkCounts where
  shortShow
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

