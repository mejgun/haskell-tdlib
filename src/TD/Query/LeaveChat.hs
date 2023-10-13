module TD.Query.LeaveChat
  (LeaveChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes the current user from chat members. Private and secret chats can't be left using this method
data LeaveChat
  = LeaveChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show LeaveChat where
  show
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

