{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CanBoostChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether the current user can boost a chat @chat_id Identifier of the chat
data CanBoostChat = CanBoostChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CanBoostChat where
  show
    CanBoostChat
      { chat_id = chat_id_
      } =
      "CanBoostChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON CanBoostChat where
  toJSON
    CanBoostChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "canBoostChat",
          "chat_id" A..= chat_id_
        ]
