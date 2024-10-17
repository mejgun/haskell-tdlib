module TD.Data.BackgroundFill
  (BackgroundFill(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a fill of a background
data BackgroundFill
  = BackgroundFillSolid -- ^ Describes a solid fill of a background
    { color :: Maybe Int -- ^ A color of the background in the RGB format
    }
  | BackgroundFillGradient -- ^ Describes a gradient fill of a background
    { top_color      :: Maybe Int -- ^ A top color of the background in the RGB format
    , bottom_color   :: Maybe Int -- ^ A bottom color of the background in the RGB format
    , rotation_angle :: Maybe Int -- ^ Clockwise rotation angle of the gradient, in degrees; 0-359. Must always be divisible by 45
    }
  | BackgroundFillFreeformGradient -- ^ Describes a freeform gradient fill of a background
    { colors :: Maybe [Int] -- ^ A list of 3 or 4 colors of the freeform gradient in the RGB format
    }
  deriving (Eq, Show)

instance I.ShortShow BackgroundFill where
  shortShow BackgroundFillSolid
    { color = color_
    }
      = "BackgroundFillSolid"
        ++ I.cc
        [ "color" `I.p` color_
        ]
  shortShow BackgroundFillGradient
    { top_color      = top_color_
    , bottom_color   = bottom_color_
    , rotation_angle = rotation_angle_
    }
      = "BackgroundFillGradient"
        ++ I.cc
        [ "top_color"      `I.p` top_color_
        , "bottom_color"   `I.p` bottom_color_
        , "rotation_angle" `I.p` rotation_angle_
        ]
  shortShow BackgroundFillFreeformGradient
    { colors = colors_
    }
      = "BackgroundFillFreeformGradient"
        ++ I.cc
        [ "colors" `I.p` colors_
        ]

instance AT.FromJSON BackgroundFill where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "backgroundFillSolid"            -> parseBackgroundFillSolid v
      "backgroundFillGradient"         -> parseBackgroundFillGradient v
      "backgroundFillFreeformGradient" -> parseBackgroundFillFreeformGradient v
      _                                -> mempty
    
    where
      parseBackgroundFillSolid :: A.Value -> AT.Parser BackgroundFill
      parseBackgroundFillSolid = A.withObject "BackgroundFillSolid" $ \o -> do
        color_ <- o A..:?  "color"
        pure $ BackgroundFillSolid
          { color = color_
          }
      parseBackgroundFillGradient :: A.Value -> AT.Parser BackgroundFill
      parseBackgroundFillGradient = A.withObject "BackgroundFillGradient" $ \o -> do
        top_color_      <- o A..:?  "top_color"
        bottom_color_   <- o A..:?  "bottom_color"
        rotation_angle_ <- o A..:?  "rotation_angle"
        pure $ BackgroundFillGradient
          { top_color      = top_color_
          , bottom_color   = bottom_color_
          , rotation_angle = rotation_angle_
          }
      parseBackgroundFillFreeformGradient :: A.Value -> AT.Parser BackgroundFill
      parseBackgroundFillFreeformGradient = A.withObject "BackgroundFillFreeformGradient" $ \o -> do
        colors_ <- o A..:?  "colors"
        pure $ BackgroundFillFreeformGradient
          { colors = colors_
          }
  parseJSON _ = mempty

instance AT.ToJSON BackgroundFill where
  toJSON BackgroundFillSolid
    { color = color_
    }
      = A.object
        [ "@type" A..= AT.String "backgroundFillSolid"
        , "color" A..= color_
        ]
  toJSON BackgroundFillGradient
    { top_color      = top_color_
    , bottom_color   = bottom_color_
    , rotation_angle = rotation_angle_
    }
      = A.object
        [ "@type"          A..= AT.String "backgroundFillGradient"
        , "top_color"      A..= top_color_
        , "bottom_color"   A..= bottom_color_
        , "rotation_angle" A..= rotation_angle_
        ]
  toJSON BackgroundFillFreeformGradient
    { colors = colors_
    }
      = A.object
        [ "@type"  A..= AT.String "backgroundFillFreeformGradient"
        , "colors" A..= colors_
        ]

