-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetRecoveryEmailAddress where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed.
-- 
-- -If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation 
-- 
-- __password__ Password of the current user
-- 
-- __new_recovery_email_address__ New recovery email address
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
    new_recovery_email_address <- o A..:? "new_recovery_email_address"
    password <- o A..:? "password"
    return $ SetRecoveryEmailAddress { new_recovery_email_address = new_recovery_email_address, password = password }