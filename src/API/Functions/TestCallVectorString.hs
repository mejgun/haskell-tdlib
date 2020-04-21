-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestCallVectorString = 
 TestCallVectorString { x :: [String] }  deriving (Show)

instance T.ToJSON TestCallVectorString where
 toJSON (TestCallVectorString { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorString", "x" A..= x ]



instance T.FromJSON TestCallVectorString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorString" -> parseTestCallVectorString v

   _ -> mempty ""
  where
   parseTestCallVectorString :: A.Value -> T.Parser TestCallVectorString
   parseTestCallVectorString = A.withObject "TestCallVectorString" $ \o -> do
    x <- o A..: "x"
    return $ TestCallVectorString { x = x }