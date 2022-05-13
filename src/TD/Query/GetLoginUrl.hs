{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetLoginUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTP URL which can be used to automatically authorize the user on a website after clicking an inline button of type inlineKeyboardButtonTypeLoginUrl.
-- Use the method getLoginUrlInfo to find whether a prior user confirmation is needed. If an error is returned, then the button must be handled as an ordinary URL button
data GetLoginUrl = GetLoginUrl
  { -- | Pass true to allow the bot to send messages to the current user
    allow_write_access :: Maybe Bool,
    -- |
    button_id :: Maybe Int,
    -- |
    message_id :: Maybe Int,
    -- | Chat identifier of the message with the button @message_id Message identifier of the message with the button @button_id Button identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetLoginUrl where
  show
    GetLoginUrl
      { allow_write_access = allow_write_access_,
        button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetLoginUrl"
        ++ U.cc
          [ U.p "allow_write_access" allow_write_access_,
            U.p "button_id" button_id_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetLoginUrl where
  toJSON
    GetLoginUrl
      { allow_write_access = allow_write_access_,
        button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getLoginUrl",
          "allow_write_access" A..= allow_write_access_,
          "button_id" A..= button_id_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
