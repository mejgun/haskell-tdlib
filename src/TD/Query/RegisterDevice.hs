{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RegisterDevice where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.DeviceToken as DeviceToken
import qualified Utils as U

-- |
-- Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription @device_token Device token @other_user_ids List of user identifiers of other users currently using the application
data RegisterDevice = RegisterDevice
  { -- |
    other_user_ids :: Maybe [Int],
    -- |
    device_token :: Maybe DeviceToken.DeviceToken
  }
  deriving (Eq)

instance Show RegisterDevice where
  show
    RegisterDevice
      { other_user_ids = other_user_ids_,
        device_token = device_token_
      } =
      "RegisterDevice"
        ++ U.cc
          [ U.p "other_user_ids" other_user_ids_,
            U.p "device_token" device_token_
          ]

instance T.ToJSON RegisterDevice where
  toJSON
    RegisterDevice
      { other_user_ids = other_user_ids_,
        device_token = device_token_
      } =
      A.object
        [ "@type" A..= T.String "registerDevice",
          "other_user_ids" A..= other_user_ids_,
          "device_token" A..= device_token_
        ]
