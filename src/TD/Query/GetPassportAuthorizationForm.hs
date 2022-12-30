{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPassportAuthorizationForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a Telegram Passport authorization form for sharing data with a service
data GetPassportAuthorizationForm = GetPassportAuthorizationForm
  { -- | Unique request identifier provided by the service
    nonce :: Maybe String,
    -- | Service's public key
    public_key :: Maybe String,
    -- | Telegram Passport element types requested by the service
    scope :: Maybe String,
    -- | User identifier of the service's bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetPassportAuthorizationForm where
  show
    GetPassportAuthorizationForm
      { nonce = nonce_,
        public_key = public_key_,
        scope = scope_,
        bot_user_id = bot_user_id_
      } =
      "GetPassportAuthorizationForm"
        ++ U.cc
          [ U.p "nonce" nonce_,
            U.p "public_key" public_key_,
            U.p "scope" scope_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON GetPassportAuthorizationForm where
  toJSON
    GetPassportAuthorizationForm
      { nonce = nonce_,
        public_key = public_key_,
        scope = scope_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "getPassportAuthorizationForm",
          "nonce" A..= nonce_,
          "public_key" A..= public_key_,
          "scope" A..= scope_,
          "bot_user_id" A..= bot_user_id_
        ]
