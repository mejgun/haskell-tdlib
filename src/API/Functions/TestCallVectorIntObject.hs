-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorIntObject where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.TestInt as TestInt

-- |
-- 
-- Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ Vector of objects to return
data TestCallVectorIntObject = 

 TestCallVectorIntObject { x :: Maybe [TestInt.TestInt] }  deriving (Eq)

instance Show TestCallVectorIntObject where
 show TestCallVectorIntObject { x=x } =
  "TestCallVectorIntObject" ++ U.cc [U.p "x" x ]

instance T.ToJSON TestCallVectorIntObject where
 toJSON TestCallVectorIntObject { x = x } =
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
    x <- o A..:? "x"
    return $ TestCallVectorIntObject { x = x }
 parseJSON _ = mempty
