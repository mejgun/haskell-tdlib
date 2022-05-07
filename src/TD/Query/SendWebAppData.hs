{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendWebAppData where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends data received from a keyboardButtonTypeWebApp web app to a bot
data SendWebAppData = SendWebAppData
  { -- |
    _data :: Maybe String,
    -- |
    button_text :: Maybe String,
    -- | Identifier of the target bot @button_text Text of the keyboardButtonTypeWebApp button, which opened the web app @data Received data
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendWebAppData where
  show
    SendWebAppData
      { _data = _data,
        button_text = button_text,
        bot_user_id = bot_user_id
      } =
      "SendWebAppData"
        ++ U.cc
          [ U.p "_data" _data,
            U.p "button_text" button_text,
            U.p "bot_user_id" bot_user_id
          ]

instance T.ToJSON SendWebAppData where
  toJSON
    SendWebAppData
      { _data = _data,
        button_text = button_text,
        bot_user_id = bot_user_id
      } =
      A.object
        [ "@type" A..= T.String "sendWebAppData",
          "data" A..= _data,
          "button_text" A..= button_text,
          "bot_user_id" A..= bot_user_id
        ]
