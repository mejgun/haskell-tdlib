{-# LANGUAGE OverloadedStrings #-}

module TD.Query.AddChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds a new member to a chat. Members can't be added to private or secret chats
data AddChatMember = AddChatMember
  { -- |
    forward_limit :: Maybe Int,
    -- |
    user_id :: Maybe Int,
    -- | Chat identifier @user_id Identifier of the user @forward_limit The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddChatMember where
  show
    AddChatMember
      { forward_limit = forward_limit,
        user_id = user_id,
        chat_id = chat_id
      } =
      "AddChatMember"
        ++ U.cc
          [ U.p "forward_limit" forward_limit,
            U.p "user_id" user_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON AddChatMember where
  toJSON
    AddChatMember
      { forward_limit = forward_limit,
        user_id = user_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "addChatMember",
          "forward_limit" A..= forward_limit,
          "user_id" A..= user_id,
          "chat_id" A..= chat_id
        ]
