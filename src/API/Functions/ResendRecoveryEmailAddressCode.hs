-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendRecoveryEmailAddressCode where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ResendRecoveryEmailAddressCode = 
 ResendRecoveryEmailAddressCode deriving (Show, Eq)

instance T.ToJSON ResendRecoveryEmailAddressCode where
 toJSON (ResendRecoveryEmailAddressCode {  }) =
  A.object [ "@type" A..= T.String "resendRecoveryEmailAddressCode" ]

instance T.FromJSON ResendRecoveryEmailAddressCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendRecoveryEmailAddressCode" -> parseResendRecoveryEmailAddressCode v
   _ -> mempty
  where
   parseResendRecoveryEmailAddressCode :: A.Value -> T.Parser ResendRecoveryEmailAddressCode
   parseResendRecoveryEmailAddressCode = A.withObject "ResendRecoveryEmailAddressCode" $ \o -> do
    return $ ResendRecoveryEmailAddressCode {  }