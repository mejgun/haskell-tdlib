-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallVectorString = 
 TestCallVectorString { x :: [String] }  -- deriving (Show)

instance T.ToJSON TestCallVectorString where
 toJSON (TestCallVectorString { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorString", "x" A..= x ]
-- testCallVectorString TestCallVectorString  { x :: [String] } 

