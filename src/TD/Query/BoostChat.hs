{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.BoostChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Boosts a chat @chat_id Identifier of the chat
data BoostChat = BoostChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show BoostChat where
  show
    BoostChat
      { chat_id = chat_id_
      } =
      "BoostChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON BoostChat where
  toJSON
    BoostChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "boostChat",
          "chat_id" A..= chat_id_
        ]
