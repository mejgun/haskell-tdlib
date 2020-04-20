-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendRecoveryEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendRecoveryEmailAddressCode = 
 ResendRecoveryEmailAddressCode -- deriving (Show)

instance T.ToJSON ResendRecoveryEmailAddressCode where
 toJSON (ResendRecoveryEmailAddressCode {  }) =
  A.object [ "@type" A..= T.String "resendRecoveryEmailAddressCode" ]
-- resendRecoveryEmailAddressCode ResendRecoveryEmailAddressCode 



instance T.FromJSON ResendRecoveryEmailAddressCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendRecoveryEmailAddressCode" -> parseResendRecoveryEmailAddressCode v
  where
   parseResendRecoveryEmailAddressCode :: A.Value -> T.Parser ResendRecoveryEmailAddressCode
   parseResendRecoveryEmailAddressCode = A.withObject "ResendRecoveryEmailAddressCode" $ \o -> do
    return $ ResendRecoveryEmailAddressCode {  }