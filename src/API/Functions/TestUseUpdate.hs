-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestUseUpdate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestUseUpdate = 
 TestUseUpdate -- deriving (Show)

instance T.ToJSON TestUseUpdate where
 toJSON (TestUseUpdate {  }) =
  A.object [ "@type" A..= T.String "testUseUpdate" ]
-- testUseUpdate TestUseUpdate 

