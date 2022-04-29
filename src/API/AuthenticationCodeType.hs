-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthenticationCodeType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

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
 -- An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically 
 -- 
 -- __pattern__ Pattern of the phone number from which the call will be made
 AuthenticationCodeTypeFlashCall { pattern :: Maybe String }  |
 -- |
 -- 
 -- An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user 
 -- 
 -- __phone_number_prefix__ Prefix of the phone number from which the call will be made
 -- 
 -- __length__ Number of digits in the code, excluding the prefix
 AuthenticationCodeTypeMissedCall { _length :: Maybe Int, phone_number_prefix :: Maybe String }  deriving (Eq)

instance Show AuthenticationCodeType where
 show AuthenticationCodeTypeTelegramMessage { _length=_length } =
  "AuthenticationCodeTypeTelegramMessage" ++ cc [p "_length" _length ]

 show AuthenticationCodeTypeSms { _length=_length } =
  "AuthenticationCodeTypeSms" ++ cc [p "_length" _length ]

 show AuthenticationCodeTypeCall { _length=_length } =
  "AuthenticationCodeTypeCall" ++ cc [p "_length" _length ]

 show AuthenticationCodeTypeFlashCall { pattern=pattern } =
  "AuthenticationCodeTypeFlashCall" ++ cc [p "pattern" pattern ]

 show AuthenticationCodeTypeMissedCall { _length=_length, phone_number_prefix=phone_number_prefix } =
  "AuthenticationCodeTypeMissedCall" ++ cc [p "_length" _length, p "phone_number_prefix" phone_number_prefix ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AuthenticationCodeType where
 toJSON AuthenticationCodeTypeTelegramMessage { _length = _length } =
  A.object [ "@type" A..= T.String "authenticationCodeTypeTelegramMessage", "length" A..= _length ]

 toJSON AuthenticationCodeTypeSms { _length = _length } =
  A.object [ "@type" A..= T.String "authenticationCodeTypeSms", "length" A..= _length ]

 toJSON AuthenticationCodeTypeCall { _length = _length } =
  A.object [ "@type" A..= T.String "authenticationCodeTypeCall", "length" A..= _length ]

 toJSON AuthenticationCodeTypeFlashCall { pattern = pattern } =
  A.object [ "@type" A..= T.String "authenticationCodeTypeFlashCall", "pattern" A..= pattern ]

 toJSON AuthenticationCodeTypeMissedCall { _length = _length, phone_number_prefix = phone_number_prefix } =
  A.object [ "@type" A..= T.String "authenticationCodeTypeMissedCall", "length" A..= _length, "phone_number_prefix" A..= phone_number_prefix ]

instance T.FromJSON AuthenticationCodeType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "authenticationCodeTypeTelegramMessage" -> parseAuthenticationCodeTypeTelegramMessage v
   "authenticationCodeTypeSms" -> parseAuthenticationCodeTypeSms v
   "authenticationCodeTypeCall" -> parseAuthenticationCodeTypeCall v
   "authenticationCodeTypeFlashCall" -> parseAuthenticationCodeTypeFlashCall v
   "authenticationCodeTypeMissedCall" -> parseAuthenticationCodeTypeMissedCall v
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

   parseAuthenticationCodeTypeMissedCall :: A.Value -> T.Parser AuthenticationCodeType
   parseAuthenticationCodeTypeMissedCall = A.withObject "AuthenticationCodeTypeMissedCall" $ \o -> do
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    phone_number_prefix <- o A..:? "phone_number_prefix"
    return $ AuthenticationCodeTypeMissedCall { _length = _length, phone_number_prefix = phone_number_prefix }
 parseJSON _ = mempty
