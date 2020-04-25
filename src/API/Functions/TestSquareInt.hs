-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestSquareInt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TestSquareInt = 
 TestSquareInt { x :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON TestSquareInt where
 toJSON (TestSquareInt { x = x }) =
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