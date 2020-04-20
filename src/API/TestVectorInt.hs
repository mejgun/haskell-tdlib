-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestVectorInt = 
 TestVectorInt { value :: [Int] }  -- deriving (Show)

instance T.ToJSON TestVectorInt where
 toJSON (TestVectorInt { value = value }) =
  A.object [ "@type" A..= T.String "testVectorInt", "value" A..= value ]
-- testVectorInt TestVectorInt  { value :: [Int] } 

