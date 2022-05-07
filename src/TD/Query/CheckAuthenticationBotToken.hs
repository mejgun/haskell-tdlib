{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CheckAuthenticationBotToken where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the authentication token of a bot; to log in as a bot. Works only when the current authorization state is authorizationStateWaitPhoneNumber. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in @token The bot token
data CheckAuthenticationBotToken = CheckAuthenticationBotToken
  { -- |
    token :: Maybe String
  }
  deriving (Eq)

instance Show CheckAuthenticationBotToken where
  show
    CheckAuthenticationBotToken
      { token = token
      } =
      "CheckAuthenticationBotToken"
        ++ U.cc
          [ U.p "token" token
          ]

instance T.ToJSON CheckAuthenticationBotToken where
  toJSON
    CheckAuthenticationBotToken
      { token = token
      } =
      A.object
        [ "@type" A..= T.String "checkAuthenticationBotToken",
          "token" A..= token
        ]
