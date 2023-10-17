module TD.Data.GroupCallVideoQuality
  (GroupCallVideoQuality(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the quality of a group call video
data GroupCallVideoQuality
  = GroupCallVideoQualityThumbnail -- ^ The worst available video quality
  | GroupCallVideoQualityMedium -- ^ The medium video quality
  | GroupCallVideoQualityFull -- ^ The best available video quality
  deriving (Eq, Show)

instance I.ShortShow GroupCallVideoQuality where
  shortShow GroupCallVideoQualityThumbnail
      = "GroupCallVideoQualityThumbnail"
  shortShow GroupCallVideoQualityMedium
      = "GroupCallVideoQualityMedium"
  shortShow GroupCallVideoQualityFull
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

