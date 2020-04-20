-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallVectorInt = 
 TestCallVectorInt { x :: [Int] }  -- deriving (Show)

instance T.ToJSON TestCallVectorInt where
 toJSON (TestCallVectorInt { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorInt", "x" A..= x ]
-- testCallVectorInt TestCallVectorInt  { x :: [Int] } 

