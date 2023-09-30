{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatBoostStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the current boost status for a channel chat @chat_id Identifier of the channel chat
data GetChatBoostStatus = GetChatBoostStatus
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatBoostStatus where
  show
    GetChatBoostStatus
      { chat_id = chat_id_
      } =
      "GetChatBoostStatus"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatBoostStatus where
  toJSON
    GetChatBoostStatus
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatBoostStatus",
          "chat_id" A..= chat_id_
        ]
