-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetPassword = 
 SetPassword { new_recovery_email_address :: String, set_recovery_email_address :: Bool, new_hint :: String, new_password :: String, old_password :: String }  -- deriving (Show)

instance T.ToJSON SetPassword where
 toJSON (SetPassword { new_recovery_email_address = new_recovery_email_address, set_recovery_email_address = set_recovery_email_address, new_hint = new_hint, new_password = new_password, old_password = old_password }) =
  A.object [ "@type" A..= T.String "setPassword", "new_recovery_email_address" A..= new_recovery_email_address, "set_recovery_email_address" A..= set_recovery_email_address, "new_hint" A..= new_hint, "new_password" A..= new_password, "old_password" A..= old_password ]
-- setPassword SetPassword  { new_recovery_email_address :: String, set_recovery_email_address :: Bool, new_hint :: String, new_password :: String, old_password :: String } 

