{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCallbackQueryAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallbackQueryPayload as CallbackQueryPayload
import qualified Utils as U

-- |
-- Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires @chat_id Identifier of the chat with the message @message_id Identifier of the message from which the query originated @payload Query payload
data GetCallbackQueryAnswer = GetCallbackQueryAnswer
  { -- |
    payload :: Maybe CallbackQueryPayload.CallbackQueryPayload,
    -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetCallbackQueryAnswer where
  show
    GetCallbackQueryAnswer
      { payload = payload_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetCallbackQueryAnswer"
        ++ U.cc
          [ U.p "payload" payload_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetCallbackQueryAnswer where
  toJSON
    GetCallbackQueryAnswer
      { payload = payload_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getCallbackQueryAnswer",
          "payload" A..= payload_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
