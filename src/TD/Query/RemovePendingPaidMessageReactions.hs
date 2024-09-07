module TD.Query.RemovePendingPaidMessageReactions
  (RemovePendingPaidMessageReactions(..)
  , defaultRemovePendingPaidMessageReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes all pending paid reactions on a message. Returns 'TD.Data.Ok.Ok'
data RemovePendingPaidMessageReactions
  = RemovePendingPaidMessageReactions
    { chat_id    :: Maybe Int -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow RemovePendingPaidMessageReactions where
  shortShow
    RemovePendingPaidMessageReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "RemovePendingPaidMessageReactions"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON RemovePendingPaidMessageReactions where
  toJSON
    RemovePendingPaidMessageReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "removePendingPaidMessageReactions"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultRemovePendingPaidMessageReactions :: RemovePendingPaidMessageReactions
defaultRemovePendingPaidMessageReactions =
  RemovePendingPaidMessageReactions
    { chat_id    = Nothing
    , message_id = Nothing
    }

