{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClickAnimatedEmojiMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated sticker to be played or a 404 error if usual animation needs to be played @chat_id Chat identifier of the message @message_id Identifier of the clicked message
data ClickAnimatedEmojiMessage = ClickAnimatedEmojiMessage
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ClickAnimatedEmojiMessage where
  show
    ClickAnimatedEmojiMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "ClickAnimatedEmojiMessage"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ClickAnimatedEmojiMessage where
  toJSON
    ClickAnimatedEmojiMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "clickAnimatedEmojiMessage",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
