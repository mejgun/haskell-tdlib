{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReportMessageReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Reports reactions set on a message to the Telegram moderators. Reactions on a message can be reported only if message.can_report_reactions
data ReportMessageReactions = ReportMessageReactions
  { -- | Identifier of the sender, which added the reaction
    sender_id :: Maybe MessageSender.MessageSender,
    -- | Message identifier
    message_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReportMessageReactions where
  show
    ReportMessageReactions
      { sender_id = sender_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "ReportMessageReactions"
        ++ U.cc
          [ U.p "sender_id" sender_id_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ReportMessageReactions where
  toJSON
    ReportMessageReactions
      { sender_id = sender_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "reportMessageReactions",
          "sender_id" A..= sender_id_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
