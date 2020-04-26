-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RegisterDevice where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DeviceToken as DeviceToken

-- |
-- 
-- Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription 
-- 
-- __device_token__ Device token
-- 
-- __other_user_ids__ List of user identifiers of other users currently using the client
data RegisterDevice = 
 RegisterDevice { other_user_ids :: Maybe [Int], device_token :: Maybe DeviceToken.DeviceToken }  deriving (Show, Eq)

instance T.ToJSON RegisterDevice where
 toJSON (RegisterDevice { other_user_ids = other_user_ids, device_token = device_token }) =
  A.object [ "@type" A..= T.String "registerDevice", "other_user_ids" A..= other_user_ids, "device_token" A..= device_token ]

instance T.FromJSON RegisterDevice where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "registerDevice" -> parseRegisterDevice v
   _ -> mempty
  where
   parseRegisterDevice :: A.Value -> T.Parser RegisterDevice
   parseRegisterDevice = A.withObject "RegisterDevice" $ \o -> do
    other_user_ids <- o A..:? "other_user_ids"
    device_token <- o A..:? "device_token"
    return $ RegisterDevice { other_user_ids = other_user_ids, device_token = device_token }