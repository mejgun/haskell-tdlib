-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestSquareInt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the squared received number; for testing only. This is an offline method. Can be called before authorization 
-- 
-- __x__ Number to square
data TestSquareInt = 

 TestSquareInt { x :: Maybe Int }  deriving (Eq)

instance Show TestSquareInt where
 show TestSquareInt { x=x } =
  "TestSquareInt" ++ cc [p "x" x ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestSquareInt where
 toJSON TestSquareInt { x = x } =
  A.object [ "@type" A..= T.String "testSquareInt", "x" A..= x ]

instance T.FromJSON TestSquareInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testSquareInt" -> parseTestSquareInt v
   _ -> mempty
  where
   parseTestSquareInt :: A.Value -> T.Parser TestSquareInt
   parseTestSquareInt = A.withObject "TestSquareInt" $ \o -> do
    x <- mconcat [ o A..:? "x", readMaybe <$> (o A..: "x" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TestSquareInt { x = x }
 parseJSON _ = mempty
