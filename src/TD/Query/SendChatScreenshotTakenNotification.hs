{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendChatScreenshotTakenNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends a notification about a screenshot taken in a chat. Supported only in private and secret chats @chat_id Chat identifier
data SendChatScreenshotTakenNotification = SendChatScreenshotTakenNotification
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendChatScreenshotTakenNotification where
  show
    SendChatScreenshotTakenNotification
      { chat_id = chat_id_
      } =
      "SendChatScreenshotTakenNotification"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON SendChatScreenshotTakenNotification where
  toJSON
    SendChatScreenshotTakenNotification
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "sendChatScreenshotTakenNotification",
          "chat_id" A..= chat_id_
        ]
