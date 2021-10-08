-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallVectorStringObject where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.TestString as TestString

-- |
-- 
-- Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ Vector of objects to return
data TestCallVectorStringObject = 

 TestCallVectorStringObject { x :: Maybe [TestString.TestString] }  deriving (Eq)

instance Show TestCallVectorStringObject where
 show TestCallVectorStringObject { x=x } =
  "TestCallVectorStringObject" ++ cc [p "x" x ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestCallVectorStringObject where
 toJSON TestCallVectorStringObject { x = x } =
  A.object [ "@type" A..= T.String "testCallVectorStringObject", "x" A..= x ]

instance T.FromJSON TestCallVectorStringObject where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallVectorStringObject" -> parseTestCallVectorStringObject v
   _ -> mempty
  where
   parseTestCallVectorStringObject :: A.Value -> T.Parser TestCallVectorStringObject
   parseTestCallVectorStringObject = A.withObject "TestCallVectorStringObject" $ \o -> do
    x <- o A..:? "x"
    return $ TestCallVectorStringObject { x = x }
 parseJSON _ = mempty
