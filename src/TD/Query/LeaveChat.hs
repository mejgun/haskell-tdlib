module TD.Query.LeaveChat
  (LeaveChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes the current user from chat members. Private and secret chats can't be left using this method. Returns 'TD.Data.Ok.Ok'
data LeaveChat
  = LeaveChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow LeaveChat where
  shortShow
    LeaveChat
      { chat_id = chat_id_
      }
        = "LeaveChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON LeaveChat where
  toJSON
    LeaveChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "leaveChat"
          , "chat_id" A..= chat_id_
          ]

