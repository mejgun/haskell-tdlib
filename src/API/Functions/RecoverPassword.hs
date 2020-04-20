-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RecoverPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RecoverPassword = 
 RecoverPassword { recovery_code :: String }  -- deriving (Show)

instance T.ToJSON RecoverPassword where
 toJSON (RecoverPassword { recovery_code = recovery_code }) =
  A.object [ "@type" A..= T.String "recoverPassword", "recovery_code" A..= recovery_code ]
-- recoverPassword RecoverPassword  { recovery_code :: String } 

