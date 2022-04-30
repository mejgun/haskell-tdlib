-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorInt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- A simple object containing a vector of numbers; for testing only 
-- 
-- __value__ Vector of numbers
data TestVectorInt = 

 TestVectorInt { value :: Maybe [Int] }  deriving (Eq)

instance Show TestVectorInt where
 show TestVectorInt { value=value } =
  "TestVectorInt" ++ U.cc [U.p "value" value ]

instance T.ToJSON TestVectorInt where
 toJSON TestVectorInt { value = value } =
  A.object [ "@type" A..= T.String "testVectorInt", "value" A..= value ]

instance T.FromJSON TestVectorInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorInt" -> parseTestVectorInt v
   _ -> mempty
  where
   parseTestVectorInt :: A.Value -> T.Parser TestVectorInt
   parseTestVectorInt = A.withObject "TestVectorInt" $ \o -> do
    value <- o A..:? "value"
    return $ TestVectorInt { value = value }
 parseJSON _ = mempty
