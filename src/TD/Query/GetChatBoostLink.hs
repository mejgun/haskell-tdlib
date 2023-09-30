{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatBoostLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTPS link to boost the specified channel chat @chat_id Identifier of the chat
data GetChatBoostLink = GetChatBoostLink
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatBoostLink where
  show
    GetChatBoostLink
      { chat_id = chat_id_
      } =
      "GetChatBoostLink"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatBoostLink where
  toJSON
    GetChatBoostLink
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatBoostLink",
          "chat_id" A..= chat_id_
        ]
