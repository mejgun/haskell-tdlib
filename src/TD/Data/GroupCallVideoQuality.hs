module TD.Data.GroupCallVideoQuality (GroupCallVideoQuality(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GroupCallVideoQuality -- ^ Describes the quality of a group call video
  = GroupCallVideoQualityThumbnail -- ^ The worst available video quality
  | GroupCallVideoQualityMedium -- ^ The medium video quality
  | GroupCallVideoQualityFull -- ^ The best available video quality
  deriving (Eq)

instance Show GroupCallVideoQuality where
  show GroupCallVideoQualityThumbnail
      = "GroupCallVideoQualityThumbnail"
  show GroupCallVideoQualityMedium
      = "GroupCallVideoQualityMedium"
  show GroupCallVideoQualityFull
      = "GroupCallVideoQualityFull"

instance AT.FromJSON GroupCallVideoQuality where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallVideoQualityThumbnail" -> pure GroupCallVideoQualityThumbnail
      "groupCallVideoQualityMedium"    -> pure GroupCallVideoQualityMedium
      "groupCallVideoQualityFull"      -> pure GroupCallVideoQualityFull
      _                                -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON GroupCallVideoQuality where
  toJSON GroupCallVideoQualityThumbnail
      = A.object
        [ "@type" A..= AT.String "groupCallVideoQualityThumbnail"
        ]
  toJSON GroupCallVideoQualityMedium
      = A.object
        [ "@type" A..= AT.String "groupCallVideoQualityMedium"
        ]
  toJSON GroupCallVideoQualityFull
      = A.object
        [ "@type" A..= AT.String "groupCallVideoQualityFull"
        ]
