{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TransferChatOwnership where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the owner of a chat. The current user must be a current owner of the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session. Available only for supergroups and channel chats
data TransferChatOwnership = TransferChatOwnership
  { -- |
    password :: Maybe String,
    -- |
    user_id :: Maybe Int,
    -- | Chat identifier @user_id Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user @password The password of the current user
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show TransferChatOwnership where
  show
    TransferChatOwnership
      { password = password_,
        user_id = user_id_,
        chat_id = chat_id_
      } =
      "TransferChatOwnership"
        ++ U.cc
          [ U.p "password" password_,
            U.p "user_id" user_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON TransferChatOwnership where
  toJSON
    TransferChatOwnership
      { password = password_,
        user_id = user_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "transferChatOwnership",
          "password" A..= password_,
          "user_id" A..= user_id_,
          "chat_id" A..= chat_id_
        ]
