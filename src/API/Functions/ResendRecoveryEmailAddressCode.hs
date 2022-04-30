-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendRecoveryEmailAddressCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Resends the 2-step verification recovery email address verification code
data ResendRecoveryEmailAddressCode = 

 ResendRecoveryEmailAddressCode deriving (Eq)

instance Show ResendRecoveryEmailAddressCode where
 show ResendRecoveryEmailAddressCode {  } =
  "ResendRecoveryEmailAddressCode" ++ U.cc [ ]

instance T.ToJSON ResendRecoveryEmailAddressCode where
 toJSON ResendRecoveryEmailAddressCode {  } =
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
 parseJSON _ = mempty
