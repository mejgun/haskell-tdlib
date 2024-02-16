module TD.Query.GetChatBoostLink
  (GetChatBoostLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an HTTPS link to boost the specified supergroup or channel chat. Returns 'TD.Data.ChatBoostLink.ChatBoostLink'
data GetChatBoostLink
  = GetChatBoostLink
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoostLink where
  shortShow
    GetChatBoostLink
      { chat_id = chat_id_
      }
        = "GetChatBoostLink"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatBoostLink where
  toJSON
    GetChatBoostLink
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatBoostLink"
          , "chat_id" A..= chat_id_
          ]

