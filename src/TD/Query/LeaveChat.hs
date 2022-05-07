{-# LANGUAGE OverloadedStrings #-}

module TD.Query.LeaveChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes the current user from chat members. Private and secret chats can't be left using this method @chat_id Chat identifier
data LeaveChat = LeaveChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show LeaveChat where
  show
    LeaveChat
      { chat_id = chat_id
      } =
      "LeaveChat"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON LeaveChat where
  toJSON
    LeaveChat
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "leaveChat",
          "chat_id" A..= chat_id
        ]
