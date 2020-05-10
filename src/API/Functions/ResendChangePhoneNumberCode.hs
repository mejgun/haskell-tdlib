-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendChangePhoneNumberCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Re-sends the authentication code sent to confirm a new phone number for the user. Works only if the previously received authenticationCodeInfo next_code_type was not null
data ResendChangePhoneNumberCode = 

 ResendChangePhoneNumberCode deriving (Show, Eq)

instance T.ToJSON ResendChangePhoneNumberCode where
 toJSON (ResendChangePhoneNumberCode {  }) =
  A.object [ "@type" A..= T.String "resendChangePhoneNumberCode" ]

instance T.FromJSON ResendChangePhoneNumberCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendChangePhoneNumberCode" -> parseResendChangePhoneNumberCode v
   _ -> mempty
  where
   parseResendChangePhoneNumberCode :: A.Value -> T.Parser ResendChangePhoneNumberCode
   parseResendChangePhoneNumberCode = A.withObject "ResendChangePhoneNumberCode" $ \o -> do
    return $ ResendChangePhoneNumberCode {  }