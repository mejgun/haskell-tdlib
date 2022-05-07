{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatClientData where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes application-specific data associated with a chat @chat_id Chat identifier @client_data New value of client_data
data SetChatClientData = SetChatClientData
  { -- |
    client_data :: Maybe String,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatClientData where
  show
    SetChatClientData
      { client_data = client_data,
        chat_id = chat_id
      } =
      "SetChatClientData"
        ++ U.cc
          [ U.p "client_data" client_data,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatClientData where
  toJSON
    SetChatClientData
      { client_data = client_data,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatClientData",
          "client_data" A..= client_data,
          "chat_id" A..= chat_id
        ]
