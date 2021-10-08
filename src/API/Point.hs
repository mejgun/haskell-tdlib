-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Point where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- A point on a Cartesian plane 
-- 
-- __x__ The point's first coordinate
-- 
-- __y__ The point's second coordinate
data Point = 

 Point { y :: Maybe Float, x :: Maybe Float }  deriving (Eq)

instance Show Point where
 show Point { y=y, x=x } =
  "Point" ++ cc [p "y" y, p "x" x ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Point where
 toJSON Point { y = y, x = x } =
  A.object [ "@type" A..= T.String "point", "y" A..= y, "x" A..= x ]

instance T.FromJSON Point where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "point" -> parsePoint v
   _ -> mempty
  where
   parsePoint :: A.Value -> T.Parser Point
   parsePoint = A.withObject "Point" $ \o -> do
    y <- o A..:? "y"
    x <- o A..:? "x"
    return $ Point { y = y, x = x }
 parseJSON _ = mempty
