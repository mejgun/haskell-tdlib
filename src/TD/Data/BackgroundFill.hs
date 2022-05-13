{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BackgroundFill where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a fill of a background
data BackgroundFill
  = -- | Describes a solid fill of a background @color A color of the background in the RGB24 format
    BackgroundFillSolid
      { -- |
        color :: Maybe Int
      }
  | -- | Describes a gradient fill of a background @top_color A top color of the background in the RGB24 format @bottom_color A bottom color of the background in the RGB24 format
    BackgroundFillGradient
      { -- | Clockwise rotation angle of the gradient, in degrees; 0-359. Must be always divisible by 45
        rotation_angle :: Maybe Int,
        -- |
        bottom_color :: Maybe Int,
        -- |
        top_color :: Maybe Int
      }
  | -- | Describes a freeform gradient fill of a background @colors A list of 3 or 4 colors of the freeform gradients in the RGB24 format
    BackgroundFillFreeformGradient
      { -- |
        colors :: Maybe [Int]
      }
  deriving (Eq)

instance Show BackgroundFill where
  show
    BackgroundFillSolid
      { color = color_
      } =
      "BackgroundFillSolid"
        ++ U.cc
          [ U.p "color" color_
          ]
  show
    BackgroundFillGradient
      { rotation_angle = rotation_angle_,
        bottom_color = bottom_color_,
        top_color = top_color_
      } =
      "BackgroundFillGradient"
        ++ U.cc
          [ U.p "rotation_angle" rotation_angle_,
            U.p "bottom_color" bottom_color_,
            U.p "top_color" top_color_
          ]
  show
    BackgroundFillFreeformGradient
      { colors = colors_
      } =
      "BackgroundFillFreeformGradient"
        ++ U.cc
          [ U.p "colors" colors_
          ]

instance T.FromJSON BackgroundFill where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "backgroundFillSolid" -> parseBackgroundFillSolid v
      "backgroundFillGradient" -> parseBackgroundFillGradient v
      "backgroundFillFreeformGradient" -> parseBackgroundFillFreeformGradient v
      _ -> mempty
    where
      parseBackgroundFillSolid :: A.Value -> T.Parser BackgroundFill
      parseBackgroundFillSolid = A.withObject "BackgroundFillSolid" $ \o -> do
        color_ <- mconcat [o A..:? "color", U.rm <$> (o A..: "color" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ BackgroundFillSolid {color = color_}

      parseBackgroundFillGradient :: A.Value -> T.Parser BackgroundFill
      parseBackgroundFillGradient = A.withObject "BackgroundFillGradient" $ \o -> do
        rotation_angle_ <- mconcat [o A..:? "rotation_angle", U.rm <$> (o A..: "rotation_angle" :: T.Parser String)] :: T.Parser (Maybe Int)
        bottom_color_ <- mconcat [o A..:? "bottom_color", U.rm <$> (o A..: "bottom_color" :: T.Parser String)] :: T.Parser (Maybe Int)
        top_color_ <- mconcat [o A..:? "top_color", U.rm <$> (o A..: "top_color" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ BackgroundFillGradient {rotation_angle = rotation_angle_, bottom_color = bottom_color_, top_color = top_color_}

      parseBackgroundFillFreeformGradient :: A.Value -> T.Parser BackgroundFill
      parseBackgroundFillFreeformGradient = A.withObject "BackgroundFillFreeformGradient" $ \o -> do
        colors_ <- o A..:? "colors"
        return $ BackgroundFillFreeformGradient {colors = colors_}
  parseJSON _ = mempty

instance T.ToJSON BackgroundFill where
  toJSON
    BackgroundFillSolid
      { color = color_
      } =
      A.object
        [ "@type" A..= T.String "backgroundFillSolid",
          "color" A..= color_
        ]
  toJSON
    BackgroundFillGradient
      { rotation_angle = rotation_angle_,
        bottom_color = bottom_color_,
        top_color = top_color_
      } =
      A.object
        [ "@type" A..= T.String "backgroundFillGradient",
          "rotation_angle" A..= rotation_angle_,
          "bottom_color" A..= bottom_color_,
          "top_color" A..= top_color_
        ]
  toJSON
    BackgroundFillFreeformGradient
      { colors = colors_
      } =
      A.object
        [ "@type" A..= T.String "backgroundFillFreeformGradient",
          "colors" A..= colors_
        ]
