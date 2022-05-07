{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatTitle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
data SetChatTitle = SetChatTitle
  { -- |
    title :: Maybe String,
    -- | Chat identifier @title New title of the chat; 1-128 characters
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatTitle where
  show
    SetChatTitle
      { title = title,
        chat_id = chat_id
      } =
      "SetChatTitle"
        ++ U.cc
          [ U.p "title" title,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatTitle where
  toJSON
    SetChatTitle
      { title = title,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatTitle",
          "title" A..= title,
          "chat_id" A..= chat_id
        ]
