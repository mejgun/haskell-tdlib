-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MaskPosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MaskPoint as MaskPoint

--main = putStrLn "ok"

data MaskPosition = 
 MaskPosition { scale :: Float, y_shift :: Float, x_shift :: Float, point :: MaskPoint.MaskPoint }  -- deriving (Show)

instance T.ToJSON MaskPosition where
 toJSON (MaskPosition { scale = scale, y_shift = y_shift, x_shift = x_shift, point = point }) =
  A.object [ "@type" A..= T.String "maskPosition", "scale" A..= scale, "y_shift" A..= y_shift, "x_shift" A..= x_shift, "point" A..= point ]
-- maskPosition MaskPosition  { scale :: Float, y_shift :: Float, x_shift :: Float, point :: MaskPoint.MaskPoint } 

