{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendWebAppCustomRequest where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends a custom request from a Web App
data SendWebAppCustomRequest = SendWebAppCustomRequest
  { -- | JSON-serialized method parameters
    parameters :: Maybe String,
    -- | The method name
    method :: Maybe String,
    -- | Identifier of the bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendWebAppCustomRequest where
  show
    SendWebAppCustomRequest
      { parameters = parameters_,
        method = method_,
        bot_user_id = bot_user_id_
      } =
      "SendWebAppCustomRequest"
        ++ U.cc
          [ U.p "parameters" parameters_,
            U.p "method" method_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SendWebAppCustomRequest where
  toJSON
    SendWebAppCustomRequest
      { parameters = parameters_,
        method = method_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "sendWebAppCustomRequest",
          "parameters" A..= parameters_,
          "method" A..= method_,
          "bot_user_id" A..= bot_user_id_
        ]
