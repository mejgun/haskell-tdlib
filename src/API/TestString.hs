-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- A simple object containing a string; for testing only 
-- 
-- __value__ String
data TestString = 

 TestString { value :: Maybe String }  deriving (Eq)

instance Show TestString where
 show TestString { value=value } =
  "TestString" ++ cc [p "value" value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestString where
 toJSON TestString { value = value } =
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
 parseJSON _ = mempty
