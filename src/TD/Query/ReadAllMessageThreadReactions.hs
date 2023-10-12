module TD.Query.ReadAllMessageThreadReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ReadAllMessageThreadReactions -- ^ Marks all reactions in a forum topic as read
  = ReadAllMessageThreadReactions
    { chat_id           :: Maybe Int -- ^ Chat identifier
    , message_thread_id :: Maybe Int -- ^ Message thread identifier in which reactions are marked as read
    }
  deriving (Eq)

instance Show ReadAllMessageThreadReactions where
  show
    ReadAllMessageThreadReactions
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = "ReadAllMessageThreadReactions"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          ]

instance AT.ToJSON ReadAllMessageThreadReactions where
  toJSON
    ReadAllMessageThreadReactions
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = A.object
          [ "@type"             A..= AT.String "readAllMessageThreadReactions"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          ]
