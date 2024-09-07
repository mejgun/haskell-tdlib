module TD.Query.CommitPendingPaidMessageReactions
  (CommitPendingPaidMessageReactions(..)
  , defaultCommitPendingPaidMessageReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Applies all pending paid reactions on a message. Returns 'TD.Data.Ok.Ok'
data CommitPendingPaidMessageReactions
  = CommitPendingPaidMessageReactions
    { chat_id    :: Maybe Int -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow CommitPendingPaidMessageReactions where
  shortShow
    CommitPendingPaidMessageReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "CommitPendingPaidMessageReactions"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON CommitPendingPaidMessageReactions where
  toJSON
    CommitPendingPaidMessageReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "commitPendingPaidMessageReactions"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultCommitPendingPaidMessageReactions :: CommitPendingPaidMessageReactions
defaultCommitPendingPaidMessageReactions =
  CommitPendingPaidMessageReactions
    { chat_id    = Nothing
    , message_id = Nothing
    }

