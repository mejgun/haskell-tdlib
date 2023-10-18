module TD.Query.ReadAllChatMentions
  (ReadAllChatMentions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Marks all mentions in a chat as read. Returns 'TD.Data.Ok.Ok'
data ReadAllChatMentions
  = ReadAllChatMentions
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllChatMentions where
  shortShow
    ReadAllChatMentions
      { chat_id = chat_id_
      }
        = "ReadAllChatMentions"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON ReadAllChatMentions where
  toJSON
    ReadAllChatMentions
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "readAllChatMentions"
          , "chat_id" A..= chat_id_
          ]

