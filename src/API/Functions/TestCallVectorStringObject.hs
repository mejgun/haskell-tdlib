-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorStringObject where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TestString as TestString

data TestCallVectorStringObject = 
 TestCallVectorStringObject { x :: Maybe [TestString.TestString] }  deriving (Show, Eq)

instance T.ToJSON TestCallVectorStringObject where
 toJSON (TestCallVectorStringObject { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorStringObject", "x" A..= x ]

instance T.FromJSON TestCallVectorStringObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorStringObject" -> parseTestCallVectorStringObject v
   _ -> mempty
  where
   parseTestCallVectorStringObject :: A.Value -> T.Parser TestCallVectorStringObject
   parseTestCallVectorStringObject = A.withObject "TestCallVectorStringObject" $ \o -> do
    x <- o A..:? "x"
    return $ TestCallVectorStringObject { x = x }