module TD.Data.AreaPosition
  ( AreaPosition(..)    
  , defaultAreaPosition 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AreaPosition
  = AreaPosition -- ^ Describes position of a rectangle area on a story media or a TON wallet card
    { x_percentage             :: Maybe Double -- ^ The abscissa of the rectangle's center, as a percentage of the media or the card width
    , y_percentage             :: Maybe Double -- ^ The ordinate of the rectangle's center, as a percentage of the media or the card height
    , width_percentage         :: Maybe Double -- ^ The width of the rectangle, as a percentage of the media or the card width
    , height_percentage        :: Maybe Double -- ^ The height of the rectangle, as a percentage of the media or the card height
    , rotation_angle           :: Maybe Double -- ^ Clockwise rotation angle of the rectangle, in degrees; 0-360
    , corner_radius_percentage :: Maybe Double -- ^ The radius of the rectangle corner rounding, as a percentage of the media or the card width
    }
  deriving (Eq, Show)

instance I.ShortShow AreaPosition where
  shortShow AreaPosition
    { x_percentage             = x_percentage_
    , y_percentage             = y_percentage_
    , width_percentage         = width_percentage_
    , height_percentage        = height_percentage_
    , rotation_angle           = rotation_angle_
    , corner_radius_percentage = corner_radius_percentage_
    }
      = "AreaPosition"
        ++ I.cc
        [ "x_percentage"             `I.p` x_percentage_
        , "y_percentage"             `I.p` y_percentage_
        , "width_percentage"         `I.p` width_percentage_
        , "height_percentage"        `I.p` height_percentage_
        , "rotation_angle"           `I.p` rotation_angle_
        , "corner_radius_percentage" `I.p` corner_radius_percentage_
        ]

instance AT.FromJSON AreaPosition where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "areaPosition" -> parseAreaPosition v
      _              -> mempty
    
    where
      parseAreaPosition :: A.Value -> AT.Parser AreaPosition
      parseAreaPosition = A.withObject "AreaPosition" $ \o -> do
        x_percentage_             <- o A..:?  "x_percentage"
        y_percentage_             <- o A..:?  "y_percentage"
        width_percentage_         <- o A..:?  "width_percentage"
        height_percentage_        <- o A..:?  "height_percentage"
        rotation_angle_           <- o A..:?  "rotation_angle"
        corner_radius_percentage_ <- o A..:?  "corner_radius_percentage"
        pure $ AreaPosition
          { x_percentage             = x_percentage_
          , y_percentage             = y_percentage_
          , width_percentage         = width_percentage_
          , height_percentage        = height_percentage_
          , rotation_angle           = rotation_angle_
          , corner_radius_percentage = corner_radius_percentage_
          }
  parseJSON _ = mempty

instance AT.ToJSON AreaPosition where
  toJSON AreaPosition
    { x_percentage             = x_percentage_
    , y_percentage             = y_percentage_
    , width_percentage         = width_percentage_
    , height_percentage        = height_percentage_
    , rotation_angle           = rotation_angle_
    , corner_radius_percentage = corner_radius_percentage_
    }
      = A.object
        [ "@type"                    A..= AT.String "areaPosition"
        , "x_percentage"             A..= x_percentage_
        , "y_percentage"             A..= y_percentage_
        , "width_percentage"         A..= width_percentage_
        , "height_percentage"        A..= height_percentage_
        , "rotation_angle"           A..= rotation_angle_
        , "corner_radius_percentage" A..= corner_radius_percentage_
        ]

defaultAreaPosition :: AreaPosition
defaultAreaPosition =
  AreaPosition
    { x_percentage             = Nothing
    , y_percentage             = Nothing
    , width_percentage         = Nothing
    , height_percentage        = Nothing
    , rotation_angle           = Nothing
    , corner_radius_percentage = Nothing
    }

