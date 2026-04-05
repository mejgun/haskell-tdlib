module TD.Query.ReadAllChatPollVotes
  (ReadAllChatPollVotes(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Marks all poll votes in a chat as read. Returns 'TD.Data.Ok.Ok'
data ReadAllChatPollVotes
  = ReadAllChatPollVotes
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllChatPollVotes where
  shortShow
    ReadAllChatPollVotes
      { chat_id = chat_id_
      }
        = "ReadAllChatPollVotes"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON ReadAllChatPollVotes where
  toJSON
    ReadAllChatPollVotes
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "readAllChatPollVotes"
          , "chat_id" A..= chat_id_
          ]

