{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReadAllChatReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Marks all reactions in a chat or a forum topic as read @chat_id Chat identifier
data ReadAllChatReactions = ReadAllChatReactions
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReadAllChatReactions where
  show
    ReadAllChatReactions
      { chat_id = chat_id_
      } =
      "ReadAllChatReactions"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON ReadAllChatReactions where
  toJSON
    ReadAllChatReactions
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "readAllChatReactions",
          "chat_id" A..= chat_id_
        ]
