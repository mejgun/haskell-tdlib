-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorIntObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TestInt as TestInt

data TestCallVectorIntObject = 
 TestCallVectorIntObject { x :: [TestInt.TestInt] }  deriving (Show)

instance T.ToJSON TestCallVectorIntObject where
 toJSON (TestCallVectorIntObject { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorIntObject", "x" A..= x ]

instance T.FromJSON TestCallVectorIntObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorIntObject" -> parseTestCallVectorIntObject v
   _ -> mempty
  where
   parseTestCallVectorIntObject :: A.Value -> T.Parser TestCallVectorIntObject
   parseTestCallVectorIntObject = A.withObject "TestCallVectorIntObject" $ \o -> do
    x <- o A..: "x"
    return $ TestCallVectorIntObject { x = x }