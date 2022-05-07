{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ProcessChatJoinRequest where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Handles a pending join request in a chat @chat_id Chat identifier @user_id Identifier of the user that sent the request @approve Pass true to approve the request; pass false to decline it
data ProcessChatJoinRequest = ProcessChatJoinRequest
  { -- |
    approve :: Maybe Bool,
    -- |
    user_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ProcessChatJoinRequest where
  show
    ProcessChatJoinRequest
      { approve = approve,
        user_id = user_id,
        chat_id = chat_id
      } =
      "ProcessChatJoinRequest"
        ++ U.cc
          [ U.p "approve" approve,
            U.p "user_id" user_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON ProcessChatJoinRequest where
  toJSON
    ProcessChatJoinRequest
      { approve = approve,
        user_id = user_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "processChatJoinRequest",
          "approve" A..= approve,
          "user_id" A..= user_id,
          "chat_id" A..= chat_id
        ]
