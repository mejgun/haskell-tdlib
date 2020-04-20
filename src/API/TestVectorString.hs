-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestVectorString = 
 TestVectorString { value :: [String] }  -- deriving (Show)

instance T.ToJSON TestVectorString where
 toJSON (TestVectorString { value = value }) =
  A.object [ "@type" A..= T.String "testVectorString", "value" A..= value ]
-- testVectorString TestVectorString  { value :: [String] } 



instance T.FromJSON TestVectorString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorString" -> parseTestVectorString v
  where
   parseTestVectorString :: A.Value -> T.Parser TestVectorString
   parseTestVectorString = A.withObject "TestVectorString" $ \o -> do
    value <- o A..: "value"
    return $ TestVectorString { value = value }