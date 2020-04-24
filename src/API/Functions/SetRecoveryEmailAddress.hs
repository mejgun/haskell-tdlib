-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetRecoveryEmailAddress where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetRecoveryEmailAddress = 
 SetRecoveryEmailAddress { new_recovery_email_address :: Maybe String, password :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SetRecoveryEmailAddress where
 toJSON (SetRecoveryEmailAddress { new_recovery_email_address = new_recovery_email_address, password = password }) =
  A.object [ "@type" A..= T.String "setRecoveryEmailAddress", "new_recovery_email_address" A..= new_recovery_email_address, "password" A..= password ]

instance T.FromJSON SetRecoveryEmailAddress where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setRecoveryEmailAddress" -> parseSetRecoveryEmailAddress v
   _ -> mempty
  where
   parseSetRecoveryEmailAddress :: A.Value -> T.Parser SetRecoveryEmailAddress
   parseSetRecoveryEmailAddress = A.withObject "SetRecoveryEmailAddress" $ \o -> do
    new_recovery_email_address <- optional $ o A..: "new_recovery_email_address"
    password <- optional $ o A..: "password"
    return $ SetRecoveryEmailAddress { new_recovery_email_address = new_recovery_email_address, password = password }