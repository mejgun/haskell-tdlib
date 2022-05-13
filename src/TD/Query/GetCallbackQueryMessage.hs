{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCallbackQueryMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a message with the callback button that originated a callback query; for bots only @chat_id Identifier of the chat the message belongs to @message_id Message identifier @callback_query_id Identifier of the callback query
data GetCallbackQueryMessage = GetCallbackQueryMessage
  { -- |
    callback_query_id :: Maybe Int,
    -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetCallbackQueryMessage where
  show
    GetCallbackQueryMessage
      { callback_query_id = callback_query_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetCallbackQueryMessage"
        ++ U.cc
          [ U.p "callback_query_id" callback_query_id_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetCallbackQueryMessage where
  toJSON
    GetCallbackQueryMessage
      { callback_query_id = callback_query_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getCallbackQueryMessage",
          "callback_query_id" A..= callback_query_id_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
