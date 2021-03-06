-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestReturnError where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Error as Error

-- |
-- 
-- Returns the specified error and ensures that the Error object is used; for testing only. This is an offline method. Can be called before authorization. Can be called synchronously 
-- 
-- __error__ The error to be returned
data TestReturnError = 

 TestReturnError { _error :: Maybe Error.Error }  deriving (Show, Eq)

instance T.ToJSON TestReturnError where
 toJSON (TestReturnError { _error = _error }) =
  A.object [ "@type" A..= T.String "testReturnError", "error" A..= _error ]

instance T.FromJSON TestReturnError where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testReturnError" -> parseTestReturnError v
   _ -> mempty
  where
   parseTestReturnError :: A.Value -> T.Parser TestReturnError
   parseTestReturnError = A.withObject "TestReturnError" $ \o -> do
    _error <- o A..:? "error"
    return $ TestReturnError { _error = _error }