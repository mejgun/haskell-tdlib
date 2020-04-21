-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthenticationCodeType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AuthenticationCodeType = 
 AuthenticationCodeTypeTelegramMessage { _length :: Int }  
 | AuthenticationCodeTypeSms { _length :: Int }  
 | AuthenticationCodeTypeCall { _length :: Int }  
 | AuthenticationCodeTypeFlashCall { pattern :: String }  deriving (Show)

instance T.ToJSON AuthenticationCodeType where
 toJSON (AuthenticationCodeTypeTelegramMessage { _length = _length }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeTelegramMessage", "length" A..= _length ]

 toJSON (AuthenticationCodeTypeSms { _length = _length }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeSms", "length" A..= _length ]

 toJSON (AuthenticationCodeTypeCall { _length = _length }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeCall", "length" A..= _length ]

 toJSON (AuthenticationCodeTypeFlashCall { pattern = pattern }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeFlashCall", "pattern" A..= pattern ]

instance T.FromJSON AuthenticationCodeType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "authenticationCodeTypeTelegramMessage" -> parseAuthenticationCodeTypeTelegramMessage v
   "authenticationCodeTypeSms" -> parseAuthenticationCodeTypeSms v
   "authenticationCodeTypeCall" -> parseAuthenticationCodeTypeCall v
   "authenticationCodeTypeFlashCall" -> parseAuthenticationCodeTypeFlashCall v
   _ -> mempty
  where
   parseAuthenticationCodeTypeTelegramMessage :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeTelegramMessage = A.withObject "AuthenticationCodeTypeTelegramMessage" $ \o -> do
    _length <- o A..: "length"
    return $ AuthenticationCodeTypeTelegramMessage { _length = _length }

   parseAuthenticationCodeTypeSms :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeSms = A.withObject "AuthenticationCodeTypeSms" $ \o -> do
    _length <- o A..: "length"
    return $ AuthenticationCodeTypeSms { _length = _length }

   parseAuthenticationCodeTypeCall :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeCall = A.withObject "AuthenticationCodeTypeCall" $ \o -> do
    _length <- o A..: "length"
    return $ AuthenticationCodeTypeCall { _length = _length }

   parseAuthenticationCodeTypeFlashCall :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeFlashCall = A.withObject "AuthenticationCodeTypeFlashCall" $ \o -> do
    pattern <- o A..: "pattern"
    return $ AuthenticationCodeTypeFlashCall { pattern = pattern }