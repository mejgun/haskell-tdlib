{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRepliedMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a message that is replied by a given message. Also returns the pinned message, the game message, the invoice message, and the topic creation message for messages
-- of the types messagePinMessage, messageGameScore, messagePaymentSuccessful, and topic messages without replied message respectively
data GetRepliedMessage = GetRepliedMessage
  { -- | Identifier of the reply message
    message_id :: Maybe Int,
    -- | Identifier of the chat the message belongs to
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetRepliedMessage where
  show
    GetRepliedMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetRepliedMessage"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetRepliedMessage where
  toJSON
    GetRepliedMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getRepliedMessage",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
