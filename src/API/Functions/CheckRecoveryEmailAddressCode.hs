-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckRecoveryEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckRecoveryEmailAddressCode = 
 CheckRecoveryEmailAddressCode { code :: String }  -- deriving (Show)

instance T.ToJSON CheckRecoveryEmailAddressCode where
 toJSON (CheckRecoveryEmailAddressCode { code = code }) =
  A.object [ "@type" A..= T.String "checkRecoveryEmailAddressCode", "code" A..= code ]
-- checkRecoveryEmailAddressCode CheckRecoveryEmailAddressCode  { code :: String } 

