-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorIntObject where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TestInt as TestInt

-- |
-- 
-- A simple object containing a vector of objects that hold a number; for testing only 
-- 
-- __value__ Vector of objects
data TestVectorIntObject = 

 TestVectorIntObject { value :: Maybe [TestInt.TestInt] }  deriving (Show, Eq)

instance T.ToJSON TestVectorIntObject where
 toJSON (TestVectorIntObject { value = value }) =
  A.object [ "@type" A..= T.String "testVectorIntObject", "value" A..= value ]

instance T.FromJSON TestVectorIntObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorIntObject" -> parseTestVectorIntObject v
   _ -> mempty
  where
   parseTestVectorIntObject :: A.Value -> T.Parser TestVectorIntObject
   parseTestVectorIntObject = A.withObject "TestVectorIntObject" $ \o -> do
    value <- o A..:? "value"
    return $ TestVectorIntObject { value = value }