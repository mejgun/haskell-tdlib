module TD.Query.RegisterDevice
  (RegisterDevice(..)
  , defaultRegisterDevice
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DeviceToken as DeviceToken

-- | Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription. Returns 'TD.Data.PushReceiverId.PushReceiverId'
data RegisterDevice
  = RegisterDevice
    { device_token   :: Maybe DeviceToken.DeviceToken -- ^ Device token
    , other_user_ids :: Maybe [Int]                   -- ^ List of user identifiers of other users currently using the application
    }
  deriving (Eq, Show)

instance I.ShortShow RegisterDevice where
  shortShow
    RegisterDevice
      { device_token   = device_token_
      , other_user_ids = other_user_ids_
      }
        = "RegisterDevice"
          ++ I.cc
          [ "device_token"   `I.p` device_token_
          , "other_user_ids" `I.p` other_user_ids_
          ]

instance AT.ToJSON RegisterDevice where
  toJSON
    RegisterDevice
      { device_token   = device_token_
      , other_user_ids = other_user_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "registerDevice"
          , "device_token"   A..= device_token_
          , "other_user_ids" A..= other_user_ids_
          ]

defaultRegisterDevice :: RegisterDevice
defaultRegisterDevice =
  RegisterDevice
    { device_token   = Nothing
    , other_user_ids = Nothing
    }

