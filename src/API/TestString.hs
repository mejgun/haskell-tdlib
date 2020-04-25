-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TestString = 
 TestString { value :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON TestString where
 toJSON (TestString { value = value }) =
  A.object [ "@type" A..= T.String "testString", "value" A..= value ]

instance T.FromJSON TestString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testString" -> parseTestString v
   _ -> mempty
  where
   parseTestString :: A.Value -> T.Parser TestString
   parseTestString = A.withObject "TestString" $ \o -> do
    value <- o A..:? "value"
    return $ TestString { value = value }