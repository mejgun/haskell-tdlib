{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessageViewers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users, opened content of the message, are returned. The method can be called if message.can_get_viewers == true @chat_id Chat identifier @message_id Identifier of the message
data GetMessageViewers = GetMessageViewers
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageViewers where
  show
    GetMessageViewers
      { message_id = message_id,
        chat_id = chat_id
      } =
      "GetMessageViewers"
        ++ U.cc
          [ U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessageViewers where
  toJSON
    GetMessageViewers
      { message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessageViewers",
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
