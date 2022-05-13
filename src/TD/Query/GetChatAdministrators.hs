{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatAdministrators where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a list of administrators of the chat with their custom titles @chat_id Chat identifier
data GetChatAdministrators = GetChatAdministrators
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatAdministrators where
  show
    GetChatAdministrators
      { chat_id = chat_id_
      } =
      "GetChatAdministrators"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatAdministrators where
  toJSON
    GetChatAdministrators
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatAdministrators",
          "chat_id" A..= chat_id_
        ]
