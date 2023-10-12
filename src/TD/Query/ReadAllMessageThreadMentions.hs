module TD.Query.ReadAllMessageThreadMentions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ReadAllMessageThreadMentions -- ^ Marks all mentions in a forum topic as read
  = ReadAllMessageThreadMentions
    { chat_id           :: Maybe Int -- ^ Chat identifier
    , message_thread_id :: Maybe Int -- ^ Message thread identifier in which mentions are marked as read
    }
  deriving (Eq)

instance Show ReadAllMessageThreadMentions where
  show
    ReadAllMessageThreadMentions
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = "ReadAllMessageThreadMentions"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          ]

instance AT.ToJSON ReadAllMessageThreadMentions where
  toJSON
    ReadAllMessageThreadMentions
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = A.object
          [ "@type"             A..= AT.String "readAllMessageThreadMentions"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          ]
