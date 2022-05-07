{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveChatActionBar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a chat action bar without any other action @chat_id Chat identifier
data RemoveChatActionBar = RemoveChatActionBar
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveChatActionBar where
  show
    RemoveChatActionBar
      { chat_id = chat_id
      } =
      "RemoveChatActionBar"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON RemoveChatActionBar where
  toJSON
    RemoveChatActionBar
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "removeChatActionBar",
          "chat_id" A..= chat_id
        ]
