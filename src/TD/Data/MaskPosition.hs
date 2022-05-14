{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MaskPosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MaskPoint as MaskPoint
import qualified Utils as U

-- |
data MaskPosition = -- | Position on a photo where a mask is placed @point Part of the face, relative to which the mask is placed
  MaskPosition
  { -- | Mask scaling coefficient. (For example, 2.0 means a doubled size)
    scale :: Maybe Float,
    -- | Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
    y_shift :: Maybe Float,
    -- | Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
    x_shift :: Maybe Float,
    -- |
    point :: Maybe MaskPoint.MaskPoint
  }
  deriving (Eq)

instance Show MaskPosition where
  show
    MaskPosition
      { scale = scale_,
        y_shift = y_shift_,
        x_shift = x_shift_,
        point = point_
      } =
      "MaskPosition"
        ++ U.cc
          [ U.p "scale" scale_,
            U.p "y_shift" y_shift_,
            U.p "x_shift" x_shift_,
            U.p "point" point_
          ]

instance T.FromJSON MaskPosition where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "maskPosition" -> parseMaskPosition v
      _ -> mempty
    where
      parseMaskPosition :: A.Value -> T.Parser MaskPosition
      parseMaskPosition = A.withObject "MaskPosition" $ \o -> do
        scale_ <- o A..:? "scale"
        y_shift_ <- o A..:? "y_shift"
        x_shift_ <- o A..:? "x_shift"
        point_ <- o A..:? "point"
        return $ MaskPosition {scale = scale_, y_shift = y_shift_, x_shift = x_shift_, point = point_}
  parseJSON _ = mempty

instance T.ToJSON MaskPosition where
  toJSON
    MaskPosition
      { scale = scale_,
        y_shift = y_shift_,
        x_shift = x_shift_,
        point = point_
      } =
      A.object
        [ "@type" A..= T.String "maskPosition",
          "scale" A..= scale_,
          "y_shift" A..= y_shift_,
          "x_shift" A..= x_shift_,
          "point" A..= point_
        ]
