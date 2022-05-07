{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatTheme where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the chat theme. Supported only in private and secret chats @chat_id Chat identifier @theme_name Name of the new chat theme; pass an empty string to return the default theme
data SetChatTheme = SetChatTheme
  { -- |
    theme_name :: Maybe String,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatTheme where
  show
    SetChatTheme
      { theme_name = theme_name,
        chat_id = chat_id
      } =
      "SetChatTheme"
        ++ U.cc
          [ U.p "theme_name" theme_name,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatTheme where
  toJSON
    SetChatTheme
      { theme_name = theme_name,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatTheme",
          "theme_name" A..= theme_name,
          "chat_id" A..= chat_id
        ]
