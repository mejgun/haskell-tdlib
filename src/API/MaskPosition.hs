-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MaskPosition where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MaskPoint as MaskPoint

-- |
-- 
-- Position on a photo where a mask should be placed 
-- 
-- __point__ Part of the face, relative to which the mask should be placed
-- 
-- __x_shift__ Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
-- 
-- __y_shift__ Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
-- 
-- __scale__ Mask scaling coefficient. (For example, 2.0 means a doubled size)
data MaskPosition = 

 MaskPosition { scale :: Maybe Float, y_shift :: Maybe Float, x_shift :: Maybe Float, point :: Maybe MaskPoint.MaskPoint }  deriving (Show, Eq)

instance T.ToJSON MaskPosition where
 toJSON (MaskPosition { scale = scale, y_shift = y_shift, x_shift = x_shift, point = point }) =
  A.object [ "@type" A..= T.String "maskPosition", "scale" A..= scale, "y_shift" A..= y_shift, "x_shift" A..= x_shift, "point" A..= point ]

instance T.FromJSON MaskPosition where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "maskPosition" -> parseMaskPosition v
   _ -> mempty
  where
   parseMaskPosition :: A.Value -> T.Parser MaskPosition
   parseMaskPosition = A.withObject "MaskPosition" $ \o -> do
    scale <- o A..:? "scale"
    y_shift <- o A..:? "y_shift"
    x_shift <- o A..:? "x_shift"
    point <- o A..:? "point"
    return $ MaskPosition { scale = scale, y_shift = y_shift, x_shift = x_shift, point = point }