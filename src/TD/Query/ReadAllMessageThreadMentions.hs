module TD.Query.ReadAllMessageThreadMentions
  (ReadAllMessageThreadMentions(..)
  , defaultReadAllMessageThreadMentions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Marks all mentions in a forum topic as read. Returns 'TD.Data.Ok.Ok'
data ReadAllMessageThreadMentions
  = ReadAllMessageThreadMentions
    { chat_id           :: Maybe Int -- ^ Chat identifier
    , message_thread_id :: Maybe Int -- ^ Message thread identifier in which mentions are marked as read
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllMessageThreadMentions where
  shortShow
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

defaultReadAllMessageThreadMentions :: ReadAllMessageThreadMentions
defaultReadAllMessageThreadMentions =
  ReadAllMessageThreadMentions
    { chat_id           = Nothing
    , message_thread_id = Nothing
    }

