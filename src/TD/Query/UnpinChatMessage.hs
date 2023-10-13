module TD.Query.UnpinChatMessage
  (UnpinChatMessage(..)
  , defaultUnpinChatMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes a pinned message from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel
data UnpinChatMessage
  = UnpinChatMessage
    { chat_id    :: Maybe Int -- ^ Identifier of the chat
    , message_id :: Maybe Int -- ^ Identifier of the removed pinned message
    }
  deriving (Eq)

instance Show UnpinChatMessage where
  show
    UnpinChatMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "UnpinChatMessage"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON UnpinChatMessage where
  toJSON
    UnpinChatMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "unpinChatMessage"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultUnpinChatMessage :: UnpinChatMessage
defaultUnpinChatMessage =
  UnpinChatMessage
    { chat_id    = Nothing
    , message_id = Nothing
    }

