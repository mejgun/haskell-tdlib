-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Point where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- A point on a Cartesian plane 
-- 
-- __x__ The point's first coordinate
-- 
-- __y__ The point's second coordinate
data Point = 

 Point { y :: Maybe Float, x :: Maybe Float }  deriving (Show, Eq)

instance T.ToJSON Point where
 toJSON (Point { y = y, x = x }) =
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