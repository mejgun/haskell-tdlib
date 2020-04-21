-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallVectorInt = 
 TestCallVectorInt { x :: [Int] }  deriving (Show)

instance T.ToJSON TestCallVectorInt where
 toJSON (TestCallVectorInt { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorInt", "x" A..= x ]



instance T.FromJSON TestCallVectorInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorInt" -> parseTestCallVectorInt v

   _ -> mempty ""
  where
   parseTestCallVectorInt :: A.Value -> T.Parser TestCallVectorInt
   parseTestCallVectorInt = A.withObject "TestCallVectorInt" $ \o -> do
    x <- o A..: "x"
    return $ TestCallVectorInt { x = x }