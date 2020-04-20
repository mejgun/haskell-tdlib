-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestVectorString = 
 TestVectorString { value :: [String] }  -- deriving (Show)

instance T.ToJSON TestVectorString where
 toJSON (TestVectorString { value = value }) =
  A.object [ "@type" A..= T.String "testVectorString", "value" A..= value ]
-- testVectorString TestVectorString  { value :: [String] } 

