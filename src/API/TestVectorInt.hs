-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestVectorInt = 
 TestVectorInt { value :: [Int] }  -- deriving (Show)

instance T.ToJSON TestVectorInt where
 toJSON (TestVectorInt { value = value }) =
  A.object [ "@type" A..= T.String "testVectorInt", "value" A..= value ]
-- testVectorInt TestVectorInt  { value :: [Int] } 



instance T.FromJSON TestVectorInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorInt" -> parseTestVectorInt v
  where
   parseTestVectorInt :: A.Value -> T.Parser TestVectorInt
   parseTestVectorInt = A.withObject "TestVectorInt" $ \o -> do
    value <- o A..: "value"
    return $ TestVectorInt { value = value }