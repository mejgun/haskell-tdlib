{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CloseChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed @chat_id Chat identifier
data CloseChat = CloseChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CloseChat where
  show
    CloseChat
      { chat_id = chat_id
      } =
      "CloseChat"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON CloseChat where
  toJSON
    CloseChat
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "closeChat",
          "chat_id" A..= chat_id
        ]
