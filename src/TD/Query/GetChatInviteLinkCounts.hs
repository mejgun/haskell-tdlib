{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatInviteLinkCounts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of chat administrators with number of their invite links. Requires owner privileges in the chat @chat_id Chat identifier
data GetChatInviteLinkCounts = GetChatInviteLinkCounts
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatInviteLinkCounts where
  show
    GetChatInviteLinkCounts
      { chat_id = chat_id_
      } =
      "GetChatInviteLinkCounts"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatInviteLinkCounts where
  toJSON
    GetChatInviteLinkCounts
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatInviteLinkCounts",
          "chat_id" A..= chat_id_
        ]
