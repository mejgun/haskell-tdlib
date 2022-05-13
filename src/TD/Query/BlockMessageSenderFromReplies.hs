{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.BlockMessageSenderFromReplies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Blocks an original sender of a message in the Replies chat
data BlockMessageSenderFromReplies = BlockMessageSenderFromReplies
  { -- | Pass true to report the sender to the Telegram moderators
    report_spam :: Maybe Bool,
    -- | Pass true to delete all messages from the same sender
    delete_all_messages :: Maybe Bool,
    -- | Pass true to delete the message
    delete_message :: Maybe Bool,
    -- | The identifier of an incoming message in the Replies chat
    message_id :: Maybe Int
  }
  deriving (Eq)

instance Show BlockMessageSenderFromReplies where
  show
    BlockMessageSenderFromReplies
      { report_spam = report_spam_,
        delete_all_messages = delete_all_messages_,
        delete_message = delete_message_,
        message_id = message_id_
      } =
      "BlockMessageSenderFromReplies"
        ++ U.cc
          [ U.p "report_spam" report_spam_,
            U.p "delete_all_messages" delete_all_messages_,
            U.p "delete_message" delete_message_,
            U.p "message_id" message_id_
          ]

instance T.ToJSON BlockMessageSenderFromReplies where
  toJSON
    BlockMessageSenderFromReplies
      { report_spam = report_spam_,
        delete_all_messages = delete_all_messages_,
        delete_message = delete_message_,
        message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "blockMessageSenderFromReplies",
          "report_spam" A..= report_spam_,
          "delete_all_messages" A..= delete_all_messages_,
          "delete_message" A..= delete_message_,
          "message_id" A..= message_id_
        ]
