-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RegisterDevice where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DeviceToken as DeviceToken

--main = putStrLn "ok"

data RegisterDevice = 
 RegisterDevice { other_user_ids :: [Int], device_token :: DeviceToken.DeviceToken }  -- deriving (Show)

instance T.ToJSON RegisterDevice where
 toJSON (RegisterDevice { other_user_ids = other_user_ids, device_token = device_token }) =
  A.object [ "@type" A..= T.String "registerDevice", "other_user_ids" A..= other_user_ids, "device_token" A..= device_token ]
-- registerDevice RegisterDevice  { other_user_ids :: [Int], device_token :: DeviceToken.DeviceToken } 



instance T.FromJSON RegisterDevice where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "registerDevice" -> parseRegisterDevice v
  where
   parseRegisterDevice :: A.Value -> T.Parser RegisterDevice
   parseRegisterDevice = A.withObject "RegisterDevice" $ \o -> do
    other_user_ids <- o A..: "other_user_ids"
    device_token <- o A..: "device_token"
    return $ RegisterDevice { other_user_ids = other_user_ids, device_token = device_token }