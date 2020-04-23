-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendChangePhoneNumberCode where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ResendChangePhoneNumberCode = 
 ResendChangePhoneNumberCode deriving (Show)

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