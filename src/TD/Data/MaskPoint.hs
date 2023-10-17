module TD.Data.MaskPoint
  (MaskPoint(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Part of the face, relative to which a mask is placed
data MaskPoint
  = MaskPointForehead -- ^ The mask is placed relatively to the forehead
  | MaskPointEyes -- ^ The mask is placed relatively to the eyes
  | MaskPointMouth -- ^ The mask is placed relatively to the mouth
  | MaskPointChin -- ^ The mask is placed relatively to the chin
  deriving (Eq, Show)

instance I.ShortShow MaskPoint where
  shortShow MaskPointForehead
      = "MaskPointForehead"
  shortShow MaskPointEyes
      = "MaskPointEyes"
  shortShow MaskPointMouth
      = "MaskPointMouth"
  shortShow MaskPointChin
      = "MaskPointChin"

instance AT.FromJSON MaskPoint where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "maskPointForehead" -> pure MaskPointForehead
      "maskPointEyes"     -> pure MaskPointEyes
      "maskPointMouth"    -> pure MaskPointMouth
      "maskPointChin"     -> pure MaskPointChin
      _                   -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON MaskPoint where
  toJSON MaskPointForehead
      = A.object
        [ "@type" A..= AT.String "maskPointForehead"
        ]
  toJSON MaskPointEyes
      = A.object
        [ "@type" A..= AT.String "maskPointEyes"
        ]
  toJSON MaskPointMouth
      = A.object
        [ "@type" A..= AT.String "maskPointMouth"
        ]
  toJSON MaskPointChin
      = A.object
        [ "@type" A..= AT.String "maskPointChin"
        ]

