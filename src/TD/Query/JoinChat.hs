{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.JoinChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds the current user as a new member to a chat. Private and secret chats can't be joined using this method @chat_id Chat identifier
data JoinChat = JoinChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show JoinChat where
  show
    JoinChat
      { chat_id = chat_id_
      } =
      "JoinChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON JoinChat where
  toJSON
    JoinChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "joinChat",
          "chat_id" A..= chat_id_
        ]
