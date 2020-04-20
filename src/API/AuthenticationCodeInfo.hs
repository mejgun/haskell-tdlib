-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthenticationCodeInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthenticationCodeType as AuthenticationCodeType

--main = putStrLn "ok"

data AuthenticationCodeInfo = 
 AuthenticationCodeInfo { timeout :: Int, next_type :: AuthenticationCodeType.AuthenticationCodeType, _type :: AuthenticationCodeType.AuthenticationCodeType, phone_number :: String }  -- deriving (Show)

instance T.ToJSON AuthenticationCodeInfo where
 toJSON (AuthenticationCodeInfo { timeout = timeout, next_type = next_type, _type = _type, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "authenticationCodeInfo", "timeout" A..= timeout, "next_type" A..= next_type, "type" A..= _type, "phone_number" A..= phone_number ]
-- authenticationCodeInfo AuthenticationCodeInfo  { timeout :: Int, next_type :: AuthenticationCodeType.AuthenticationCodeType, _type :: AuthenticationCodeType.AuthenticationCodeType, phone_number :: String } 



instance T.FromJSON AuthenticationCodeInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "authenticationCodeInfo" -> parseAuthenticationCodeInfo v
  where
   parseAuthenticationCodeInfo :: A.Value -> T.Parser AuthenticationCodeInfo
   parseAuthenticationCodeInfo = A.withObject "AuthenticationCodeInfo" $ \o -> do
    timeout <- o A..: "timeout"
    next_type <- o A..: "next_type"
    _type <- o A..: "type"
    phone_number <- o A..: "phone_number"
    return $ AuthenticationCodeInfo { timeout = timeout, next_type = next_type, _type = _type, phone_number = phone_number }