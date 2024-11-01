module TD.Query.GetChatSponsoredMessages
  (GetChatSponsoredMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns sponsored messages to be shown in a chat; for channel chats and chats with bots only. Returns 'TD.Data.SponsoredMessages.SponsoredMessages'
data GetChatSponsoredMessages
  = GetChatSponsoredMessages
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatSponsoredMessages where
  shortShow
    GetChatSponsoredMessages
      { chat_id = chat_id_
      }
        = "GetChatSponsoredMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatSponsoredMessages where
  toJSON
    GetChatSponsoredMessages
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatSponsoredMessages"
          , "chat_id" A..= chat_id_
          ]

