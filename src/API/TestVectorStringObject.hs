-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorStringObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TestString as TestString

--main = putStrLn "ok"

data TestVectorStringObject = 
 TestVectorStringObject { value :: [TestString.TestString] }  -- deriving (Show)

instance T.ToJSON TestVectorStringObject where
 toJSON (TestVectorStringObject { value = value }) =
  A.object [ "@type" A..= T.String "testVectorStringObject", "value" A..= value ]
-- testVectorStringObject TestVectorStringObject  { value :: [TestString.TestString] } 

