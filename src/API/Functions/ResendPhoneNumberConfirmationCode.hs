-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendPhoneNumberConfirmationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Resends phone number confirmation code
data ResendPhoneNumberConfirmationCode = 

 ResendPhoneNumberConfirmationCode deriving (Show, Eq)

instance T.ToJSON ResendPhoneNumberConfirmationCode where
 toJSON (ResendPhoneNumberConfirmationCode {  }) =
  A.object [ "@type" A..= T.String "resendPhoneNumberConfirmationCode" ]

instance T.FromJSON ResendPhoneNumberConfirmationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendPhoneNumberConfirmationCode" -> parseResendPhoneNumberConfirmationCode v
   _ -> mempty
  where
   parseResendPhoneNumberConfirmationCode :: A.Value -> T.Parser ResendPhoneNumberConfirmationCode
   parseResendPhoneNumberConfirmationCode = A.withObject "ResendPhoneNumberConfirmationCode" $ \o -> do
    return $ ResendPhoneNumberConfirmationCode {  }