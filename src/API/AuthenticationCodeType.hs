-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthenticationCodeType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Provides information about the method by which an authentication code is delivered to the user
data AuthenticationCodeType = 
 -- |
 -- 
 -- An authentication code is delivered via a private Telegram message, which can be viewed from another active session 
 -- 
 -- __length__ Length of the code
 AuthenticationCodeTypeTelegramMessage { _length :: Maybe Int }  |
 -- |
 -- 
 -- An authentication code is delivered via an SMS message to the specified phone number 
 -- 
 -- __length__ Length of the code
 AuthenticationCodeTypeSms { _length :: Maybe Int }  |
 -- |
 -- 
 -- An authentication code is delivered via a phone call to the specified phone number 
 -- 
 -- __length__ Length of the code
 AuthenticationCodeTypeCall { _length :: Maybe Int }  |
 -- |
 -- 
 -- An authentication code is delivered by an immediately canceled call to the specified phone number. The number from which the call was made is the code 
 -- 
 -- __pattern__ Pattern of the phone number from which the call will be made
 AuthenticationCodeTypeFlashCall { pattern :: Maybe String }  deriving (Show, Eq)

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
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AuthenticationCodeTypeTelegramMessage { _length = _length }

   parseAuthenticationCodeTypeSms :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeSms = A.withObject "AuthenticationCodeTypeSms" $ \o -> do
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AuthenticationCodeTypeSms { _length = _length }

   parseAuthenticationCodeTypeCall :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeCall = A.withObject "AuthenticationCodeTypeCall" $ \o -> do
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AuthenticationCodeTypeCall { _length = _length }

   parseAuthenticationCodeTypeFlashCall :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeFlashCall = A.withObject "AuthenticationCodeTypeFlashCall" $ \o -> do
    pattern <- o A..:? "pattern"
    return $ AuthenticationCodeTypeFlashCall { pattern = pattern }