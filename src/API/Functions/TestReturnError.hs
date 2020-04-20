-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestReturnError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Error as Error

--main = putStrLn "ok"

data TestReturnError = 
 TestReturnError { _error :: Error.Error }  -- deriving (Show)

instance T.ToJSON TestReturnError where
 toJSON (TestReturnError { _error = _error }) =
  A.object [ "@type" A..= T.String "testReturnError", "error" A..= _error ]
-- testReturnError TestReturnError  { _error :: Error.Error } 

