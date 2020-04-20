-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestInt = 
 TestInt { value :: Int }  -- deriving (Show)

instance T.ToJSON TestInt where
 toJSON (TestInt { value = value }) =
  A.object [ "@type" A..= T.String "testInt", "value" A..= value ]
-- testInt TestInt  { value :: Int } 

