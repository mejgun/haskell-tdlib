{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckChatUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether a username can be set for a chat @chat_id Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if the chat is being created @username Username to be checked
data CheckChatUsername = CheckChatUsername
  { -- |
    username :: Maybe String,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CheckChatUsername where
  show
    CheckChatUsername
      { username = username_,
        chat_id = chat_id_
      } =
      "CheckChatUsername"
        ++ U.cc
          [ U.p "username" username_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON CheckChatUsername where
  toJSON
    CheckChatUsername
      { username = username_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "checkChatUsername",
          "username" A..= username_,
          "chat_id" A..= chat_id_
        ]
