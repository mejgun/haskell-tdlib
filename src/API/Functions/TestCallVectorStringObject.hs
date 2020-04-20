-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorStringObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TestString as TestString

--main = putStrLn "ok"

data TestCallVectorStringObject = 
 TestCallVectorStringObject { x :: [TestString.TestString] }  -- deriving (Show)

instance T.ToJSON TestCallVectorStringObject where
 toJSON (TestCallVectorStringObject { x = x }) =
  A.object [ "@type" A..= T.String "testCallVectorStringObject", "x" A..= x ]
-- testCallVectorStringObject TestCallVectorStringObject  { x :: [TestString.TestString] } 



instance T.FromJSON TestCallVectorStringObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorStringObject" -> parseTestCallVectorStringObject v
  where
   parseTestCallVectorStringObject :: A.Value -> T.Parser TestCallVectorStringObject
   parseTestCallVectorStringObject = A.withObject "TestCallVectorStringObject" $ \o -> do
    x <- o A..: "x"
    return $ TestCallVectorStringObject { x = x }