{-# LANGUAGE OverloadedStrings #-}

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
      { report_spam = report_spam,
        delete_all_messages = delete_all_messages,
        delete_message = delete_message,
        message_id = message_id
      } =
      "BlockMessageSenderFromReplies"
        ++ U.cc
          [ U.p "report_spam" report_spam,
            U.p "delete_all_messages" delete_all_messages,
            U.p "delete_message" delete_message,
            U.p "message_id" message_id
          ]

instance T.ToJSON BlockMessageSenderFromReplies where
  toJSON
    BlockMessageSenderFromReplies
      { report_spam = report_spam,
        delete_all_messages = delete_all_messages,
        delete_message = delete_message,
        message_id = message_id
      } =
      A.object
        [ "@type" A..= T.String "blockMessageSenderFromReplies",
          "report_spam" A..= report_spam,
          "delete_all_messages" A..= delete_all_messages,
          "delete_message" A..= delete_message,
          "message_id" A..= message_id
        ]
