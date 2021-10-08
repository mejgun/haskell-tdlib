-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the received string; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ String to return
data TestCallString = 

 TestCallString { x :: Maybe String }  deriving (Eq)

instance Show TestCallString where
 show TestCallString { x=x } =
  "TestCallString" ++ cc [p "x" x ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestCallString where
 toJSON TestCallString { x = x } =
  A.object [ "@type" A..= T.String "testCallString", "x" A..= x ]

instance T.FromJSON TestCallString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallString" -> parseTestCallString v
   _ -> mempty
  where
   parseTestCallString :: A.Value -> T.Parser TestCallString
   parseTestCallString = A.withObject "TestCallString" $ \o -> do
    x <- o A..:? "x"
    return $ TestCallString { x = x }
 parseJSON _ = mempty
