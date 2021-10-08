-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorInt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- A simple object containing a vector of numbers; for testing only 
-- 
-- __value__ Vector of numbers
data TestVectorInt = 

 TestVectorInt { value :: Maybe [Int] }  deriving (Eq)

instance Show TestVectorInt where
 show TestVectorInt { value=value } =
  "TestVectorInt" ++ cc [p "value" value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestVectorInt where
 toJSON TestVectorInt { value = value } =
  A.object [ "@type" A..= T.String "testVectorInt", "value" A..= value ]

instance T.FromJSON TestVectorInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorInt" -> parseTestVectorInt v
   _ -> mempty
  where
   parseTestVectorInt :: A.Value -> T.Parser TestVectorInt
   parseTestVectorInt = A.withObject "TestVectorInt" $ \o -> do
    value <- o A..:? "value"
    return $ TestVectorInt { value = value }
 parseJSON _ = mempty
