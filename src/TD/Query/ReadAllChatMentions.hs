module TD.Query.ReadAllChatMentions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ReadAllChatMentions -- ^ Marks all mentions in a chat as read
  = ReadAllChatMentions
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show ReadAllChatMentions where
  show
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
