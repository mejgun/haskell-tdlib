{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ReadAllChatMentions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Marks all mentions in a chat as read @chat_id Chat identifier
data ReadAllChatMentions = ReadAllChatMentions
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReadAllChatMentions where
  show
    ReadAllChatMentions
      { chat_id = chat_id
      } =
      "ReadAllChatMentions"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON ReadAllChatMentions where
  toJSON
    ReadAllChatMentions
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "readAllChatMentions",
          "chat_id" A..= chat_id
        ]
