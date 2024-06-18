module TD.Data.PremiumStoryFeature
  (PremiumStoryFeature(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a story feature available to Premium users
data PremiumStoryFeature
  = PremiumStoryFeaturePriorityOrder -- ^ Stories of the current user are displayed before stories of non-Premium contacts, supergroups, and channels
  | PremiumStoryFeatureStealthMode -- ^ The ability to hide the fact that the user viewed other's stories
  | PremiumStoryFeaturePermanentViewsHistory -- ^ The ability to check who opened the current user's stories after they expire
  | PremiumStoryFeatureCustomExpirationDuration -- ^ The ability to set custom expiration duration for stories
  | PremiumStoryFeatureSaveStories -- ^ The ability to save other's unprotected stories
  | PremiumStoryFeatureLinksAndFormatting -- ^ The ability to use links and formatting in story caption, and use inputStoryAreaTypeLink areas
  | PremiumStoryFeatureVideoQuality -- ^ The ability to choose better quality for viewed stories
  deriving (Eq, Show)

instance I.ShortShow PremiumStoryFeature where
  shortShow PremiumStoryFeaturePriorityOrder
      = "PremiumStoryFeaturePriorityOrder"
  shortShow PremiumStoryFeatureStealthMode
      = "PremiumStoryFeatureStealthMode"
  shortShow PremiumStoryFeaturePermanentViewsHistory
      = "PremiumStoryFeaturePermanentViewsHistory"
  shortShow PremiumStoryFeatureCustomExpirationDuration
      = "PremiumStoryFeatureCustomExpirationDuration"
  shortShow PremiumStoryFeatureSaveStories
      = "PremiumStoryFeatureSaveStories"
  shortShow PremiumStoryFeatureLinksAndFormatting
      = "PremiumStoryFeatureLinksAndFormatting"
  shortShow PremiumStoryFeatureVideoQuality
      = "PremiumStoryFeatureVideoQuality"

instance AT.FromJSON PremiumStoryFeature where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumStoryFeaturePriorityOrder"            -> pure PremiumStoryFeaturePriorityOrder
      "premiumStoryFeatureStealthMode"              -> pure PremiumStoryFeatureStealthMode
      "premiumStoryFeaturePermanentViewsHistory"    -> pure PremiumStoryFeaturePermanentViewsHistory
      "premiumStoryFeatureCustomExpirationDuration" -> pure PremiumStoryFeatureCustomExpirationDuration
      "premiumStoryFeatureSaveStories"              -> pure PremiumStoryFeatureSaveStories
      "premiumStoryFeatureLinksAndFormatting"       -> pure PremiumStoryFeatureLinksAndFormatting
      "premiumStoryFeatureVideoQuality"             -> pure PremiumStoryFeatureVideoQuality
      _                                             -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON PremiumStoryFeature where
  toJSON PremiumStoryFeaturePriorityOrder
      = A.object
        [ "@type" A..= AT.String "premiumStoryFeaturePriorityOrder"
        ]
  toJSON PremiumStoryFeatureStealthMode
      = A.object
        [ "@type" A..= AT.String "premiumStoryFeatureStealthMode"
        ]
  toJSON PremiumStoryFeaturePermanentViewsHistory
      = A.object
        [ "@type" A..= AT.String "premiumStoryFeaturePermanentViewsHistory"
        ]
  toJSON PremiumStoryFeatureCustomExpirationDuration
      = A.object
        [ "@type" A..= AT.String "premiumStoryFeatureCustomExpirationDuration"
        ]
  toJSON PremiumStoryFeatureSaveStories
      = A.object
        [ "@type" A..= AT.String "premiumStoryFeatureSaveStories"
        ]
  toJSON PremiumStoryFeatureLinksAndFormatting
      = A.object
        [ "@type" A..= AT.String "premiumStoryFeatureLinksAndFormatting"
        ]
  toJSON PremiumStoryFeatureVideoQuality
      = A.object
        [ "@type" A..= AT.String "premiumStoryFeatureVideoQuality"
        ]

