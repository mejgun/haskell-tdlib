{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a message @chat_id Identifier of the chat the message belongs to @message_id Identifier of the message to get
data GetMessage = GetMessage
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessage where
  show
    GetMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessage"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessage where
  toJSON
    GetMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessage",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
