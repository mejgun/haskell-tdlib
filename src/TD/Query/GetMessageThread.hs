{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessageThread where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a message thread. Can be used only if message.can_get_message_thread == true @chat_id Chat identifier @message_id Identifier of the message
data GetMessageThread = GetMessageThread
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageThread where
  show
    GetMessageThread
      { message_id = message_id,
        chat_id = chat_id
      } =
      "GetMessageThread"
        ++ U.cc
          [ U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessageThread where
  toJSON
    GetMessageThread
      { message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessageThread",
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
