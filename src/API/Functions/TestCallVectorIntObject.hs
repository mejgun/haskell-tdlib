-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorIntObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TestInt as TestInt

--main = putStrLn "ok"

data TestCallVectorIntObject = 
 TestCallVectorIntObject { x :: [TestInt.TestInt] }  -- deriving (Show)

instance T.ToJSON TestCallVectorIntObject where
 toJSON (TestCallVectorIntObject { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorIntObject", "x" A..= x ]
-- testCallVectorIntObject TestCallVectorIntObject  { x :: [TestInt.TestInt] } 

