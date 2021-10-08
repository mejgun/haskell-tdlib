-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestVectorString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- A simple object containing a vector of strings; for testing only 
-- 
-- __value__ Vector of strings
data TestVectorString = 

 TestVectorString { value :: Maybe [String] }  deriving (Eq)

instance Show TestVectorString where
 show TestVectorString { value=value } =
  "TestVectorString" ++ cc [p "value" value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestVectorString where
 toJSON TestVectorString { value = value } =
  A.object [ "@type" A..= T.String "testVectorString", "value" A..= value ]

instance T.FromJSON TestVectorString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testVectorString" -> parseTestVectorString v
   _ -> mempty
  where
   parseTestVectorString :: A.Value -> T.Parser TestVectorString
   parseTestVectorString = A.withObject "TestVectorString" $ \o -> do
    value <- o A..:? "value"
    return $ TestVectorString { value = value }
 parseJSON _ = mempty
