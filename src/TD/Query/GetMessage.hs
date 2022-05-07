{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a message @chat_id Identifier of the chat the message belongs to @message_id Identifier of the message to get
data GetMessage = GetMessage
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessage where
  show
    GetMessage
      { message_id = message_id,
        chat_id = chat_id
      } =
      "GetMessage"
        ++ U.cc
          [ U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessage where
  toJSON
    GetMessage
      { message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessage",
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
