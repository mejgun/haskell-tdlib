-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallEmpty where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallEmpty = 
 TestCallEmpty -- deriving (Show)

instance T.ToJSON TestCallEmpty where
 toJSON (TestCallEmpty {  }) =
  A.object [ "@type" A..= T.String "testCallEmpty" ]
-- testCallEmpty TestCallEmpty 

