{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetRepliedMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a message that is replied by a given message. Also returns the pinned message, the game message, and the invoice message for messages of the types messagePinMessage, messageGameScore, and messagePaymentSuccessful respectively
data GetRepliedMessage = GetRepliedMessage
  { -- |
    message_id :: Maybe Int,
    -- | Identifier of the chat the message belongs to @message_id Identifier of the reply message
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetRepliedMessage where
  show
    GetRepliedMessage
      { message_id = message_id,
        chat_id = chat_id
      } =
      "GetRepliedMessage"
        ++ U.cc
          [ U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetRepliedMessage where
  toJSON
    GetRepliedMessage
      { message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getRepliedMessage",
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
