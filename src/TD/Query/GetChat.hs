{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a chat by its identifier, this is an offline request if the current user is not a bot @chat_id Chat identifier
data GetChat = GetChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChat where
  show
    GetChat
      { chat_id = chat_id
      } =
      "GetChat"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChat where
  toJSON
    GetChat
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChat",
          "chat_id" A..= chat_id
        ]
