{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { _data = _data_,
        button_text = button_text_,
        bot_user_id = bot_user_id_
      } =
      "SendWebAppData"
        ++ U.cc
          [ U.p "_data" _data_,
            U.p "button_text" button_text_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SendWebAppData where
  toJSON
    SendWebAppData
      { _data = _data_,
        button_text = button_text_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "sendWebAppData",
          "data" A..= _data_,
          "button_text" A..= button_text_,
          "bot_user_id" A..= bot_user_id_
        ]
