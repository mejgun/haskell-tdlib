-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ Vector of strings to return
data TestCallVectorString = 

 TestCallVectorString { x :: Maybe [String] }  deriving (Eq)

instance Show TestCallVectorString where
 show TestCallVectorString { x=x } =
  "TestCallVectorString" ++ cc [p "x" x ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestCallVectorString where
 toJSON TestCallVectorString { x = x } =
  A.object [ "@type" A..= T.String "testCallVectorString", "x" A..= x ]

instance T.FromJSON TestCallVectorString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorString" -> parseTestCallVectorString v
   _ -> mempty
  where
   parseTestCallVectorString :: A.Value -> T.Parser TestCallVectorString
   parseTestCallVectorString = A.withObject "TestCallVectorString" $ \o -> do
    x <- o A..:? "x"
    return $ TestCallVectorString { x = x }
 parseJSON _ = mempty
