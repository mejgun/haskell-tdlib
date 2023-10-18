module TD.Query.ReadAllChatReactions
  (ReadAllChatReactions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Marks all reactions in a chat or a forum topic as read. Returns 'TD.Data.Ok.Ok'
data ReadAllChatReactions
  = ReadAllChatReactions
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllChatReactions where
  shortShow
    ReadAllChatReactions
      { chat_id = chat_id_
      }
        = "ReadAllChatReactions"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON ReadAllChatReactions where
  toJSON
    ReadAllChatReactions
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "readAllChatReactions"
          , "chat_id" A..= chat_id_
          ]

