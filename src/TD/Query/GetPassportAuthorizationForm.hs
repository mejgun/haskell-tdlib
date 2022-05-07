{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetPassportAuthorizationForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a Telegram Passport authorization form for sharing data with a service @bot_user_id User identifier of the service's bot @scope Telegram Passport element types requested by the service @public_key Service's public key @nonce Unique request identifier provided by the service
data GetPassportAuthorizationForm = GetPassportAuthorizationForm
  { -- |
    nonce :: Maybe String,
    -- |
    public_key :: Maybe String,
    -- |
    scope :: Maybe String,
    -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetPassportAuthorizationForm where
  show
    GetPassportAuthorizationForm
      { nonce = nonce,
        public_key = public_key,
        scope = scope,
        bot_user_id = bot_user_id
      } =
      "GetPassportAuthorizationForm"
        ++ U.cc
          [ U.p "nonce" nonce,
            U.p "public_key" public_key,
            U.p "scope" scope,
            U.p "bot_user_id" bot_user_id
          ]

instance T.ToJSON GetPassportAuthorizationForm where
  toJSON
    GetPassportAuthorizationForm
      { nonce = nonce,
        public_key = public_key,
        scope = scope,
        bot_user_id = bot_user_id
      } =
      A.object
        [ "@type" A..= T.String "getPassportAuthorizationForm",
          "nonce" A..= nonce,
          "public_key" A..= public_key,
          "scope" A..= scope,
          "bot_user_id" A..= bot_user_id
        ]
