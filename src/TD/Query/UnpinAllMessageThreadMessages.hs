module TD.Query.UnpinAllMessageThreadMessages
  (UnpinAllMessageThreadMessages(..)
  , defaultUnpinAllMessageThreadMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes all pinned messages from a forum topic; requires can_pin_messages member right in the supergroup. Returns 'TD.Data.Ok.Ok'
data UnpinAllMessageThreadMessages
  = UnpinAllMessageThreadMessages
    { chat_id           :: Maybe Int -- ^ Identifier of the chat
    , message_thread_id :: Maybe Int -- ^ Message thread identifier in which messages will be unpinned
    }
  deriving (Eq, Show)

instance I.ShortShow UnpinAllMessageThreadMessages where
  shortShow
    UnpinAllMessageThreadMessages
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = "UnpinAllMessageThreadMessages"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          ]

instance AT.ToJSON UnpinAllMessageThreadMessages where
  toJSON
    UnpinAllMessageThreadMessages
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = A.object
          [ "@type"             A..= AT.String "unpinAllMessageThreadMessages"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          ]

defaultUnpinAllMessageThreadMessages :: UnpinAllMessageThreadMessages
defaultUnpinAllMessageThreadMessages =
  UnpinAllMessageThreadMessages
    { chat_id           = Nothing
    , message_thread_id = Nothing
    }

