-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestInt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- A simple object containing a number; for testing only 
-- 
-- __value__ Number
data TestInt = 

 TestInt { value :: Maybe Int }  deriving (Eq)

instance Show TestInt where
 show TestInt { value=value } =
  "TestInt" ++ cc [p "value" value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestInt where
 toJSON TestInt { value = value } =
  A.object [ "@type" A..= T.String "testInt", "value" A..= value ]

instance T.FromJSON TestInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testInt" -> parseTestInt v
   _ -> mempty
  where
   parseTestInt :: A.Value -> T.Parser TestInt
   parseTestInt = A.withObject "TestInt" $ \o -> do
    value <- mconcat [ o A..:? "value", readMaybe <$> (o A..: "value" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TestInt { value = value }
 parseJSON _ = mempty
