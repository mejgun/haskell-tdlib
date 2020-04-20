-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RecoverAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RecoverAuthenticationPassword = 
 RecoverAuthenticationPassword { recovery_code :: String }  -- deriving (Show)

instance T.ToJSON RecoverAuthenticationPassword where
 toJSON (RecoverAuthenticationPassword { recovery_code = recovery_code }) =
  A.object [ "@type" A..= T.String "recoverAuthenticationPassword", "recovery_code" A..= recovery_code ]
-- recoverAuthenticationPassword RecoverAuthenticationPassword  { recovery_code :: String } 

