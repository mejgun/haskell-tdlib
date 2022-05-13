{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Returns information about a single member of a chat @chat_id Chat identifier @member_id Member identifier
data GetChatMember = GetChatMember
  { -- |
    member_id :: Maybe MessageSender.MessageSender,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatMember where
  show
    GetChatMember
      { member_id = member_id_,
        chat_id = chat_id_
      } =
      "GetChatMember"
        ++ U.cc
          [ U.p "member_id" member_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatMember where
  toJSON
    GetChatMember
      { member_id = member_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatMember",
          "member_id" A..= member_id_,
          "chat_id" A..= chat_id_
        ]
