-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecoveryEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRecoveryEmailAddress = 
 GetRecoveryEmailAddress { password :: String }  -- deriving (Show)

instance T.ToJSON GetRecoveryEmailAddress where
 toJSON (GetRecoveryEmailAddress { password = password }) =
  A.object [ "@type" A..= T.String "getRecoveryEmailAddress", "password" A..= password ]
-- getRecoveryEmailAddress GetRecoveryEmailAddress  { password :: String } 

