{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageViewers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users, opened content of the message, are returned. The method can be called if message.can_get_viewers == true
data GetMessageViewers = GetMessageViewers
  { -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageViewers where
  show
    GetMessageViewers
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageViewers"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageViewers where
  toJSON
    GetMessageViewers
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageViewers",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
