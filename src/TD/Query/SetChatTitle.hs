{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatTitle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
data SetChatTitle = SetChatTitle
  { -- | New title of the chat; 1-128 characters
    title :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatTitle where
  show
    SetChatTitle
      { title = title_,
        chat_id = chat_id_
      } =
      "SetChatTitle"
        ++ U.cc
          [ U.p "title" title_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatTitle where
  toJSON
    SetChatTitle
      { title = title_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatTitle",
          "title" A..= title_,
          "chat_id" A..= chat_id_
        ]
