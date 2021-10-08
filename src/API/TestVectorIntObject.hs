-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorIntObject where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.TestInt as TestInt

-- |
-- 
-- A simple object containing a vector of objects that hold a number; for testing only 
-- 
-- __value__ Vector of objects
data TestVectorIntObject = 

 TestVectorIntObject { value :: Maybe [TestInt.TestInt] }  deriving (Eq)

instance Show TestVectorIntObject where
 show TestVectorIntObject { value=value } =
  "TestVectorIntObject" ++ cc [p "value" value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestVectorIntObject where
 toJSON TestVectorIntObject { value = value } =
  A.object [ "@type" A..= T.String "testVectorIntObject", "value" A..= value ]

instance T.FromJSON TestVectorIntObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorIntObject" -> parseTestVectorIntObject v
   _ -> mempty
  where
   parseTestVectorIntObject :: A.Value -> T.Parser TestVectorIntObject
   parseTestVectorIntObject = A.withObject "TestVectorIntObject" $ \o -> do
    value <- o A..:? "value"
    return $ TestVectorIntObject { value = value }
 parseJSON _ = mempty
