{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds a new member to a chat. Members can't be added to private or secret chats
data AddChatMember = AddChatMember
  { -- | The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
    forward_limit :: Maybe Int,
    -- | Identifier of the user
    user_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddChatMember where
  show
    AddChatMember
      { forward_limit = forward_limit_,
        user_id = user_id_,
        chat_id = chat_id_
      } =
      "AddChatMember"
        ++ U.cc
          [ U.p "forward_limit" forward_limit_,
            U.p "user_id" user_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON AddChatMember where
  toJSON
    AddChatMember
      { forward_limit = forward_limit_,
        user_id = user_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "addChatMember",
          "forward_limit" A..= forward_limit_,
          "user_id" A..= user_id_,
          "chat_id" A..= chat_id_
        ]
