module TD.Query.GetChatBoostStatus
  (GetChatBoostStatus(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the current boost status for a supergroup or a channel chat. Returns 'TD.Data.ChatBoostStatus.ChatBoostStatus'
data GetChatBoostStatus
  = GetChatBoostStatus
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoostStatus where
  shortShow
    GetChatBoostStatus
      { chat_id = chat_id_
      }
        = "GetChatBoostStatus"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatBoostStatus where
  toJSON
    GetChatBoostStatus
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatBoostStatus"
          , "chat_id" A..= chat_id_
          ]

