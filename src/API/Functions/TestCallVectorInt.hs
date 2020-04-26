-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorInt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ Vector of numbers to return
data TestCallVectorInt = 
 TestCallVectorInt { x :: Maybe [Int] }  deriving (Show, Eq)

instance T.ToJSON TestCallVectorInt where
 toJSON (TestCallVectorInt { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorInt", "x" A..= x ]

instance T.FromJSON TestCallVectorInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorInt" -> parseTestCallVectorInt v
   _ -> mempty
  where
   parseTestCallVectorInt :: A.Value -> T.Parser TestCallVectorInt
   parseTestCallVectorInt = A.withObject "TestCallVectorInt" $ \o -> do
    x <- o A..:? "x"
    return $ TestCallVectorInt { x = x }