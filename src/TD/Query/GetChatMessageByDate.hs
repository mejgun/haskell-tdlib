{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatMessageByDate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the last message sent in a chat no later than the specified date @chat_id Chat identifier @date Point in time (Unix timestamp) relative to which to search for messages
data GetChatMessageByDate = GetChatMessageByDate
  { -- |
    date :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatMessageByDate where
  show
    GetChatMessageByDate
      { date = date,
        chat_id = chat_id
      } =
      "GetChatMessageByDate"
        ++ U.cc
          [ U.p "date" date,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatMessageByDate where
  toJSON
    GetChatMessageByDate
      { date = date,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatMessageByDate",
          "date" A..= date,
          "chat_id" A..= chat_id
        ]
