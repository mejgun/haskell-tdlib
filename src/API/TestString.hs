-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestString = 
 TestString { value :: String }  -- deriving (Show)

instance T.ToJSON TestString where
 toJSON (TestString { value = value }) =
  A.object [ "@type" A..= T.String "testString", "value" A..= value ]
-- testString TestString  { value :: String } 



instance T.FromJSON TestString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testString" -> parseTestString v
  where
   parseTestString :: A.Value -> T.Parser TestString
   parseTestString = A.withObject "TestString" $ \o -> do
    value <- o A..: "value"
    return $ TestString { value = value }