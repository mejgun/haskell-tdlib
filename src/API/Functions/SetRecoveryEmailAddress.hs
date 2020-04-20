-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetRecoveryEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetRecoveryEmailAddress = 
 SetRecoveryEmailAddress { new_recovery_email_address :: String, password :: String }  -- deriving (Show)

instance T.ToJSON SetRecoveryEmailAddress where
 toJSON (SetRecoveryEmailAddress { new_recovery_email_address = new_recovery_email_address, password = password }) =
  A.object [ "@type" A..= T.String "setRecoveryEmailAddress", "new_recovery_email_address" A..= new_recovery_email_address, "password" A..= password ]
-- setRecoveryEmailAddress SetRecoveryEmailAddress  { new_recovery_email_address :: String, password :: String } 

