module TD.Query.GetChatPinnedMessage
  (GetChatPinnedMessage(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a newest pinned message in the chat. Returns a 404 error if the message doesn't exist. Returns 'TD.Data.Message.Message'
data GetChatPinnedMessage
  = GetChatPinnedMessage
    { chat_id :: Maybe Int -- ^ Identifier of the chat the message belongs to
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatPinnedMessage where
  shortShow
    GetChatPinnedMessage
      { chat_id = chat_id_
      }
        = "GetChatPinnedMessage"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatPinnedMessage where
  toJSON
    GetChatPinnedMessage
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatPinnedMessage"
          , "chat_id" A..= chat_id_
          ]

