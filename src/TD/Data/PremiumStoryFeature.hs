{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumStoryFeature where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a story feature available to Premium users
data PremiumStoryFeature
  = -- | User stories are displayed before stories of non-premium contacts and channels
    PremiumStoryFeaturePriorityOrder
  | -- | The ability to hide the fact that the user viewed other's stories
    PremiumStoryFeatureStealthMode
  | -- | The ability to check who opened the current user's stories after they expire
    PremiumStoryFeaturePermanentViewsHistory
  | -- | The ability to set custom expiration duration for stories
    PremiumStoryFeatureCustomExpirationDuration
  | -- | The ability to save other's unprotected stories
    PremiumStoryFeatureSaveStories
  | -- | The ability to use links and formatting in story caption
    PremiumStoryFeatureLinksAndFormatting
  deriving (Eq)

instance Show PremiumStoryFeature where
  show PremiumStoryFeaturePriorityOrder =
    "PremiumStoryFeaturePriorityOrder"
      ++ U.cc
        []
  show PremiumStoryFeatureStealthMode =
    "PremiumStoryFeatureStealthMode"
      ++ U.cc
        []
  show PremiumStoryFeaturePermanentViewsHistory =
    "PremiumStoryFeaturePermanentViewsHistory"
      ++ U.cc
        []
  show PremiumStoryFeatureCustomExpirationDuration =
    "PremiumStoryFeatureCustomExpirationDuration"
      ++ U.cc
        []
  show PremiumStoryFeatureSaveStories =
    "PremiumStoryFeatureSaveStories"
      ++ U.cc
        []
  show PremiumStoryFeatureLinksAndFormatting =
    "PremiumStoryFeatureLinksAndFormatting"
      ++ U.cc
        []

instance T.FromJSON PremiumStoryFeature where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumStoryFeaturePriorityOrder" -> parsePremiumStoryFeaturePriorityOrder v
      "premiumStoryFeatureStealthMode" -> parsePremiumStoryFeatureStealthMode v
      "premiumStoryFeaturePermanentViewsHistory" -> parsePremiumStoryFeaturePermanentViewsHistory v
      "premiumStoryFeatureCustomExpirationDuration" -> parsePremiumStoryFeatureCustomExpirationDuration v
      "premiumStoryFeatureSaveStories" -> parsePremiumStoryFeatureSaveStories v
      "premiumStoryFeatureLinksAndFormatting" -> parsePremiumStoryFeatureLinksAndFormatting v
      _ -> mempty
    where
      parsePremiumStoryFeaturePriorityOrder :: A.Value -> T.Parser PremiumStoryFeature
      parsePremiumStoryFeaturePriorityOrder = A.withObject "PremiumStoryFeaturePriorityOrder" $ \_ -> return PremiumStoryFeaturePriorityOrder

      parsePremiumStoryFeatureStealthMode :: A.Value -> T.Parser PremiumStoryFeature
      parsePremiumStoryFeatureStealthMode = A.withObject "PremiumStoryFeatureStealthMode" $ \_ -> return PremiumStoryFeatureStealthMode

      parsePremiumStoryFeaturePermanentViewsHistory :: A.Value -> T.Parser PremiumStoryFeature
      parsePremiumStoryFeaturePermanentViewsHistory = A.withObject "PremiumStoryFeaturePermanentViewsHistory" $ \_ -> return PremiumStoryFeaturePermanentViewsHistory

      parsePremiumStoryFeatureCustomExpirationDuration :: A.Value -> T.Parser PremiumStoryFeature
      parsePremiumStoryFeatureCustomExpirationDuration = A.withObject "PremiumStoryFeatureCustomExpirationDuration" $ \_ -> return PremiumStoryFeatureCustomExpirationDuration

      parsePremiumStoryFeatureSaveStories :: A.Value -> T.Parser PremiumStoryFeature
      parsePremiumStoryFeatureSaveStories = A.withObject "PremiumStoryFeatureSaveStories" $ \_ -> return PremiumStoryFeatureSaveStories

      parsePremiumStoryFeatureLinksAndFormatting :: A.Value -> T.Parser PremiumStoryFeature
      parsePremiumStoryFeatureLinksAndFormatting = A.withObject "PremiumStoryFeatureLinksAndFormatting" $ \_ -> return PremiumStoryFeatureLinksAndFormatting
  parseJSON _ = mempty

instance T.ToJSON PremiumStoryFeature where
  toJSON PremiumStoryFeaturePriorityOrder =
    A.object
      [ "@type" A..= T.String "premiumStoryFeaturePriorityOrder"
      ]
  toJSON PremiumStoryFeatureStealthMode =
    A.object
      [ "@type" A..= T.String "premiumStoryFeatureStealthMode"
      ]
  toJSON PremiumStoryFeaturePermanentViewsHistory =
    A.object
      [ "@type" A..= T.String "premiumStoryFeaturePermanentViewsHistory"
      ]
  toJSON PremiumStoryFeatureCustomExpirationDuration =
    A.object
      [ "@type" A..= T.String "premiumStoryFeatureCustomExpirationDuration"
      ]
  toJSON PremiumStoryFeatureSaveStories =
    A.object
      [ "@type" A..= T.String "premiumStoryFeatureSaveStories"
      ]
  toJSON PremiumStoryFeatureLinksAndFormatting =
    A.object
      [ "@type" A..= T.String "premiumStoryFeatureLinksAndFormatting"
      ]
