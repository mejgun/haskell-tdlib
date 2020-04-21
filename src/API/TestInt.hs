-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TestInt = 
 TestInt { value :: Int }  deriving (Show)

instance T.ToJSON TestInt where
 toJSON (TestInt { value = value }) =
  A.object [ "@type" A..= T.String "testInt", "value" A..= value ]

instance T.FromJSON TestInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testInt" -> parseTestInt v
   _ -> mempty
  where
   parseTestInt :: A.Value -> T.Parser TestInt
   parseTestInt = A.withObject "TestInt" $ \o -> do
    value <- o A..: "value"
    return $ TestInt { value = value }