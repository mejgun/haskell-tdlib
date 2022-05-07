{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right @chat_id Identifier of the chat @param_description New chat description; 0-255 characters
data SetChatDescription = SetChatDescription
  { -- |
    description :: Maybe String,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatDescription where
  show
    SetChatDescription
      { description = description,
        chat_id = chat_id
      } =
      "SetChatDescription"
        ++ U.cc
          [ U.p "description" description,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatDescription where
  toJSON
    SetChatDescription
      { description = description,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatDescription",
          "description" A..= description,
          "chat_id" A..= chat_id
        ]
