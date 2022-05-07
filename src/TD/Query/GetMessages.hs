{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about messages. If a message is not found, returns null on the corresponding position of the result @chat_id Identifier of the chat the messages belong to @message_ids Identifiers of the messages to get
data GetMessages = GetMessages
  { -- |
    message_ids :: Maybe [Int],
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessages where
  show
    GetMessages
      { message_ids = message_ids,
        chat_id = chat_id
      } =
      "GetMessages"
        ++ U.cc
          [ U.p "message_ids" message_ids,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessages where
  toJSON
    GetMessages
      { message_ids = message_ids,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessages",
          "message_ids" A..= message_ids,
          "chat_id" A..= chat_id
        ]
