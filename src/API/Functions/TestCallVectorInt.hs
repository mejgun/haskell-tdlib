-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorInt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ Vector of numbers to return
data TestCallVectorInt = 

 TestCallVectorInt { x :: Maybe [Int] }  deriving (Eq)

instance Show TestCallVectorInt where
 show TestCallVectorInt { x=x } =
  "TestCallVectorInt" ++ cc [p "x" x ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestCallVectorInt where
 toJSON TestCallVectorInt { x = x } =
  A.object [ "@type" A..= T.String "testCallVectorInt", "x" A..= x ]

instance T.FromJSON TestCallVectorInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorInt" -> parseTestCallVectorInt v
   _ -> mempty
  where
   parseTestCallVectorInt :: A.Value -> T.Parser TestCallVectorInt
   parseTestCallVectorInt = A.withObject "TestCallVectorInt" $ \o -> do
    x <- o A..:? "x"
    return $ TestCallVectorInt { x = x }
 parseJSON _ = mempty
