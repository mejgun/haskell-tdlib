{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetLoginUrlInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button
data GetLoginUrlInfo = GetLoginUrlInfo
  { -- | Button identifier
    button_id :: Maybe Int,
    -- | Message identifier of the message with the button
    message_id :: Maybe Int,
    -- | Chat identifier of the message with the button
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetLoginUrlInfo where
  show
    GetLoginUrlInfo
      { button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetLoginUrlInfo"
        ++ U.cc
          [ U.p "button_id" button_id_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetLoginUrlInfo where
  toJSON
    GetLoginUrlInfo
      { button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getLoginUrlInfo",
          "button_id" A..= button_id_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
