-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestBytes = 
 TestBytes { value :: String }  -- deriving (Show)

instance T.ToJSON TestBytes where
 toJSON (TestBytes { value = value }) =
  A.object [ "@type" A..= T.String "testBytes", "value" A..= value ]
-- testBytes TestBytes  { value :: String } 

