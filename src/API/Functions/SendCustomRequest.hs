-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCustomRequest where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SendCustomRequest = 
 SendCustomRequest { parameters :: String, method :: String }  -- deriving (Show)

instance T.ToJSON SendCustomRequest where
 toJSON (SendCustomRequest { parameters = parameters, method = method }) =
  A.object [ "@type" A..= T.String "sendCustomRequest", "parameters" A..= parameters, "method" A..= method ]
-- sendCustomRequest SendCustomRequest  { parameters :: String, method :: String } 

