-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallBytes = 
 TestCallBytes { x :: String }  -- deriving (Show)

instance T.ToJSON TestCallBytes where
 toJSON (TestCallBytes { x = x }) =
  A.object [ "@type" A..= T.String "testCallBytes", "x" A..= x ]
-- testCallBytes TestCallBytes  { x :: String } 

