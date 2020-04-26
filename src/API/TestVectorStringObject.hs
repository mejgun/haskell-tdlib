-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorStringObject where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TestString as TestString

-- |
-- 
-- A simple object containing a vector of objects that hold a string; for testing only 
-- 
-- __value__ Vector of objects
data TestVectorStringObject = 
 TestVectorStringObject { value :: Maybe [TestString.TestString] }  deriving (Show, Eq)

instance T.ToJSON TestVectorStringObject where
 toJSON (TestVectorStringObject { value = value }) =
  A.object [ "@type" A..= T.String "testVectorStringObject", "value" A..= value ]

instance T.FromJSON TestVectorStringObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorStringObject" -> parseTestVectorStringObject v
   _ -> mempty
  where
   parseTestVectorStringObject :: A.Value -> T.Parser TestVectorStringObject
   parseTestVectorStringObject = A.withObject "TestVectorStringObject" $ \o -> do
    value <- o A..:? "value"
    return $ TestVectorStringObject { value = value }