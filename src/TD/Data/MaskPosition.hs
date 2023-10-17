module TD.Data.MaskPosition
  ( MaskPosition(..)    
  , defaultMaskPosition 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MaskPoint as MaskPoint

data MaskPosition
  = MaskPosition -- ^ Position on a photo where a mask is placed
    { point   :: Maybe MaskPoint.MaskPoint -- ^ Part of the face, relative to which the mask is placed
    , x_shift :: Maybe Double              -- ^ Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
    , y_shift :: Maybe Double              -- ^ Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
    , scale   :: Maybe Double              -- ^ Mask scaling coefficient. (For example, 2.0 means a doubled size)
    }
  deriving (Eq, Show)

instance I.ShortShow MaskPosition where
  shortShow MaskPosition
    { point   = point_
    , x_shift = x_shift_
    , y_shift = y_shift_
    , scale   = scale_
    }
      = "MaskPosition"
        ++ I.cc
        [ "point"   `I.p` point_
        , "x_shift" `I.p` x_shift_
        , "y_shift" `I.p` y_shift_
        , "scale"   `I.p` scale_
        ]

instance AT.FromJSON MaskPosition where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "maskPosition" -> parseMaskPosition v
      _              -> mempty
    
    where
      parseMaskPosition :: A.Value -> AT.Parser MaskPosition
      parseMaskPosition = A.withObject "MaskPosition" $ \o -> do
        point_   <- o A..:?  "point"
        x_shift_ <- o A..:?  "x_shift"
        y_shift_ <- o A..:?  "y_shift"
        scale_   <- o A..:?  "scale"
        pure $ MaskPosition
          { point   = point_
          , x_shift = x_shift_
          , y_shift = y_shift_
          , scale   = scale_
          }
  parseJSON _ = mempty

instance AT.ToJSON MaskPosition where
  toJSON MaskPosition
    { point   = point_
    , x_shift = x_shift_
    , y_shift = y_shift_
    , scale   = scale_
    }
      = A.object
        [ "@type"   A..= AT.String "maskPosition"
        , "point"   A..= point_
        , "x_shift" A..= x_shift_
        , "y_shift" A..= y_shift_
        , "scale"   A..= scale_
        ]

defaultMaskPosition :: MaskPosition
defaultMaskPosition =
  MaskPosition
    { point   = Nothing
    , x_shift = Nothing
    , y_shift = Nothing
    , scale   = Nothing
    }

