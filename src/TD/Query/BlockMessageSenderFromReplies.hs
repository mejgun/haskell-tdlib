module TD.Query.BlockMessageSenderFromReplies
  (BlockMessageSenderFromReplies(..)
  , defaultBlockMessageSenderFromReplies
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Blocks an original sender of a message in the Replies chat. Returns 'TD.Data.Ok.Ok'
data BlockMessageSenderFromReplies
  = BlockMessageSenderFromReplies
    { message_id          :: Maybe Int  -- ^ The identifier of an incoming message in the Replies chat
    , delete_message      :: Maybe Bool -- ^ Pass true to delete the message
    , delete_all_messages :: Maybe Bool -- ^ Pass true to delete all messages from the same sender
    , report_spam         :: Maybe Bool -- ^ Pass true to report the sender to the Telegram moderators
    }
  deriving (Eq, Show)

instance I.ShortShow BlockMessageSenderFromReplies where
  shortShow
    BlockMessageSenderFromReplies
      { message_id          = message_id_
      , delete_message      = delete_message_
      , delete_all_messages = delete_all_messages_
      , report_spam         = report_spam_
      }
        = "BlockMessageSenderFromReplies"
          ++ I.cc
          [ "message_id"          `I.p` message_id_
          , "delete_message"      `I.p` delete_message_
          , "delete_all_messages" `I.p` delete_all_messages_
          , "report_spam"         `I.p` report_spam_
          ]

instance AT.ToJSON BlockMessageSenderFromReplies where
  toJSON
    BlockMessageSenderFromReplies
      { message_id          = message_id_
      , delete_message      = delete_message_
      , delete_all_messages = delete_all_messages_
      , report_spam         = report_spam_
      }
        = A.object
          [ "@type"               A..= AT.String "blockMessageSenderFromReplies"
          , "message_id"          A..= message_id_
          , "delete_message"      A..= delete_message_
          , "delete_all_messages" A..= delete_all_messages_
          , "report_spam"         A..= report_spam_
          ]

defaultBlockMessageSenderFromReplies :: BlockMessageSenderFromReplies
defaultBlockMessageSenderFromReplies =
  BlockMessageSenderFromReplies
    { message_id          = Nothing
    , delete_message      = Nothing
    , delete_all_messages = Nothing
    , report_spam         = Nothing
    }

