-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetPassword = 
 SetPassword { new_recovery_email_address :: String, set_recovery_email_address :: Bool, new_hint :: String, new_password :: String, old_password :: String }  deriving (Show)

instance T.ToJSON SetPassword where
 toJSON (SetPassword { new_recovery_email_address = new_recovery_email_address, set_recovery_email_address = set_recovery_email_address, new_hint = new_hint, new_password = new_password, old_password = old_password }) =
  A.object [ "@type" A..= T.String "setPassword", "new_recovery_email_address" A..= new_recovery_email_address, "set_recovery_email_address" A..= set_recovery_email_address, "new_hint" A..= new_hint, "new_password" A..= new_password, "old_password" A..= old_password ]

instance T.FromJSON SetPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPassword" -> parseSetPassword v
   _ -> mempty
  where
   parseSetPassword :: A.Value -> T.Parser SetPassword
   parseSetPassword = A.withObject "SetPassword" $ \o -> do
    new_recovery_email_address <- o A..: "new_recovery_email_address"
    set_recovery_email_address <- o A..: "set_recovery_email_address"
    new_hint <- o A..: "new_hint"
    new_password <- o A..: "new_password"
    old_password <- o A..: "old_password"
    return $ SetPassword { new_recovery_email_address = new_recovery_email_address, set_recovery_email_address = set_recovery_email_address, new_hint = new_hint, new_password = new_password, old_password = old_password }