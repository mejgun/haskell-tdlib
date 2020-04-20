-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallString = 
 TestCallString { x :: String }  -- deriving (Show)

instance T.ToJSON TestCallString where
 toJSON (TestCallString { x = x }) =
  A.object [ "@type" A..= T.String "testCallString", "x" A..= x ]
-- testCallString TestCallString  { x :: String } 

