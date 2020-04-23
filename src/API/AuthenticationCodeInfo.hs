-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthenticationCodeInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthenticationCodeType as AuthenticationCodeType

data AuthenticationCodeInfo = 
 AuthenticationCodeInfo { timeout :: Maybe Int, next_type :: Maybe AuthenticationCodeType.AuthenticationCodeType, _type :: Maybe AuthenticationCodeType.AuthenticationCodeType, phone_number :: Maybe String }  deriving (Show)

instance T.ToJSON AuthenticationCodeInfo where
 toJSON (AuthenticationCodeInfo { timeout = timeout, next_type = next_type, _type = _type, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "authenticationCodeInfo", "timeout" A..= timeout, "next_type" A..= next_type, "type" A..= _type, "phone_number" A..= phone_number ]

instance T.FromJSON AuthenticationCodeInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "authenticationCodeInfo" -> parseAuthenticationCodeInfo v
   _ -> mempty
  where
   parseAuthenticationCodeInfo :: A.Value -> T.Parser AuthenticationCodeInfo
   parseAuthenticationCodeInfo = A.withObject "AuthenticationCodeInfo" $ \o -> do
    timeout <- optional $ o A..: "timeout"
    next_type <- optional $ o A..: "next_type"
    _type <- optional $ o A..: "type"
    phone_number <- optional $ o A..: "phone_number"
    return $ AuthenticationCodeInfo { timeout = timeout, next_type = next_type, _type = _type, phone_number = phone_number }