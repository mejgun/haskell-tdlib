-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckEmailAddressVerificationCode where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CheckEmailAddressVerificationCode = 
 CheckEmailAddressVerificationCode { code :: Maybe String }  deriving (Show)

instance T.ToJSON CheckEmailAddressVerificationCode where
 toJSON (CheckEmailAddressVerificationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkEmailAddressVerificationCode", "code" A..= code ]

instance T.FromJSON CheckEmailAddressVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkEmailAddressVerificationCode" -> parseCheckEmailAddressVerificationCode v
   _ -> mempty
  where
   parseCheckEmailAddressVerificationCode :: A.Value -> T.Parser CheckEmailAddressVerificationCode
   parseCheckEmailAddressVerificationCode = A.withObject "CheckEmailAddressVerificationCode" $ \o -> do
    code <- optional $ o A..: "code"
    return $ CheckEmailAddressVerificationCode { code = code }