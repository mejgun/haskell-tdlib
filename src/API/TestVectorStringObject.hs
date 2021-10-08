-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorStringObject where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.TestString as TestString

-- |
-- 
-- A simple object containing a vector of objects that hold a string; for testing only 
-- 
-- __value__ Vector of objects
data TestVectorStringObject = 

 TestVectorStringObject { value :: Maybe [TestString.TestString] }  deriving (Eq)

instance Show TestVectorStringObject where
 show TestVectorStringObject { value=value } =
  "TestVectorStringObject" ++ cc [p "value" value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestVectorStringObject where
 toJSON TestVectorStringObject { value = value } =
  A.object [ "@type" A..= T.String "testVectorStringObject", "value" A..= value ]

instance T.FromJSON TestVectorStringObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorStringObject" -> parseTestVectorStringObject v
   _ -> mempty
  where
   parseTestVectorStringObject :: A.Value -> T.Parser TestVectorStringObject
   parseTestVectorStringObject = A.withObject "TestVectorStringObject" $ \o -> do
    value <- o A..:? "value"
    return $ TestVectorStringObject { value = value }
 parseJSON _ = mempty
