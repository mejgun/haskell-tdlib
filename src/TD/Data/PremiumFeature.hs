module TD.Data.PremiumFeature
  (PremiumFeature(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a feature available to Premium users
data PremiumFeature
  = PremiumFeatureIncreasedLimits -- ^ Increased limits
  | PremiumFeatureIncreasedUploadFileSize -- ^ Increased maximum upload file size
  | PremiumFeatureImprovedDownloadSpeed -- ^ Improved download speed
  | PremiumFeatureVoiceRecognition -- ^ The ability to convert voice notes to text
  | PremiumFeatureDisabledAds -- ^ Disabled ads
  | PremiumFeatureUniqueReactions -- ^ Allowed to use more reactions
  | PremiumFeatureUniqueStickers -- ^ Allowed to use premium stickers with unique effects
  | PremiumFeatureCustomEmoji -- ^ Allowed to use custom emoji stickers in message texts and captions
  | PremiumFeatureAdvancedChatManagement -- ^ Ability to change position of the main chat list, archive and mute all new chats from non-contacts, and completely disable notifications about the user's contacts joined Telegram
  | PremiumFeatureProfileBadge -- ^ A badge in the user's profile
  | PremiumFeatureEmojiStatus -- ^ An emoji status shown along with the user's name
  | PremiumFeatureAnimatedProfilePhoto -- ^ Profile photo animation on message and chat screens
  | PremiumFeatureForumTopicIcon -- ^ The ability to set a custom emoji as a forum topic icon
  | PremiumFeatureAppIcons -- ^ Allowed to set a premium application icons
  | PremiumFeatureRealTimeChatTranslation -- ^ Allowed to translate chat messages real-time
  | PremiumFeatureUpgradedStories -- ^ Allowed to use many additional features for stories
  | PremiumFeatureChatBoost -- ^ The ability to boost chats
  | PremiumFeatureAccentColor -- ^ The ability to choose accent color for replies and user profile
  | PremiumFeatureBackgroundForBoth -- ^ The ability to set private chat background for both users
  deriving (Eq, Show)

instance I.ShortShow PremiumFeature where
  shortShow PremiumFeatureIncreasedLimits
      = "PremiumFeatureIncreasedLimits"
  shortShow PremiumFeatureIncreasedUploadFileSize
      = "PremiumFeatureIncreasedUploadFileSize"
  shortShow PremiumFeatureImprovedDownloadSpeed
      = "PremiumFeatureImprovedDownloadSpeed"
  shortShow PremiumFeatureVoiceRecognition
      = "PremiumFeatureVoiceRecognition"
  shortShow PremiumFeatureDisabledAds
      = "PremiumFeatureDisabledAds"
  shortShow PremiumFeatureUniqueReactions
      = "PremiumFeatureUniqueReactions"
  shortShow PremiumFeatureUniqueStickers
      = "PremiumFeatureUniqueStickers"
  shortShow PremiumFeatureCustomEmoji
      = "PremiumFeatureCustomEmoji"
  shortShow PremiumFeatureAdvancedChatManagement
      = "PremiumFeatureAdvancedChatManagement"
  shortShow PremiumFeatureProfileBadge
      = "PremiumFeatureProfileBadge"
  shortShow PremiumFeatureEmojiStatus
      = "PremiumFeatureEmojiStatus"
  shortShow PremiumFeatureAnimatedProfilePhoto
      = "PremiumFeatureAnimatedProfilePhoto"
  shortShow PremiumFeatureForumTopicIcon
      = "PremiumFeatureForumTopicIcon"
  shortShow PremiumFeatureAppIcons
      = "PremiumFeatureAppIcons"
  shortShow PremiumFeatureRealTimeChatTranslation
      = "PremiumFeatureRealTimeChatTranslation"
  shortShow PremiumFeatureUpgradedStories
      = "PremiumFeatureUpgradedStories"
  shortShow PremiumFeatureChatBoost
      = "PremiumFeatureChatBoost"
  shortShow PremiumFeatureAccentColor
      = "PremiumFeatureAccentColor"
  shortShow PremiumFeatureBackgroundForBoth
      = "PremiumFeatureBackgroundForBoth"

instance AT.FromJSON PremiumFeature where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumFeatureIncreasedLimits"         -> pure PremiumFeatureIncreasedLimits
      "premiumFeatureIncreasedUploadFileSize" -> pure PremiumFeatureIncreasedUploadFileSize
      "premiumFeatureImprovedDownloadSpeed"   -> pure PremiumFeatureImprovedDownloadSpeed
      "premiumFeatureVoiceRecognition"        -> pure PremiumFeatureVoiceRecognition
      "premiumFeatureDisabledAds"             -> pure PremiumFeatureDisabledAds
      "premiumFeatureUniqueReactions"         -> pure PremiumFeatureUniqueReactions
      "premiumFeatureUniqueStickers"          -> pure PremiumFeatureUniqueStickers
      "premiumFeatureCustomEmoji"             -> pure PremiumFeatureCustomEmoji
      "premiumFeatureAdvancedChatManagement"  -> pure PremiumFeatureAdvancedChatManagement
      "premiumFeatureProfileBadge"            -> pure PremiumFeatureProfileBadge
      "premiumFeatureEmojiStatus"             -> pure PremiumFeatureEmojiStatus
      "premiumFeatureAnimatedProfilePhoto"    -> pure PremiumFeatureAnimatedProfilePhoto
      "premiumFeatureForumTopicIcon"          -> pure PremiumFeatureForumTopicIcon
      "premiumFeatureAppIcons"                -> pure PremiumFeatureAppIcons
      "premiumFeatureRealTimeChatTranslation" -> pure PremiumFeatureRealTimeChatTranslation
      "premiumFeatureUpgradedStories"         -> pure PremiumFeatureUpgradedStories
      "premiumFeatureChatBoost"               -> pure PremiumFeatureChatBoost
      "premiumFeatureAccentColor"             -> pure PremiumFeatureAccentColor
      "premiumFeatureBackgroundForBoth"       -> pure PremiumFeatureBackgroundForBoth
      _                                       -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON PremiumFeature where
  toJSON PremiumFeatureIncreasedLimits
      = A.object
        [ "@type" A..= AT.String "premiumFeatureIncreasedLimits"
        ]
  toJSON PremiumFeatureIncreasedUploadFileSize
      = A.object
        [ "@type" A..= AT.String "premiumFeatureIncreasedUploadFileSize"
        ]
  toJSON PremiumFeatureImprovedDownloadSpeed
      = A.object
        [ "@type" A..= AT.String "premiumFeatureImprovedDownloadSpeed"
        ]
  toJSON PremiumFeatureVoiceRecognition
      = A.object
        [ "@type" A..= AT.String "premiumFeatureVoiceRecognition"
        ]
  toJSON PremiumFeatureDisabledAds
      = A.object
        [ "@type" A..= AT.String "premiumFeatureDisabledAds"
        ]
  toJSON PremiumFeatureUniqueReactions
      = A.object
        [ "@type" A..= AT.String "premiumFeatureUniqueReactions"
        ]
  toJSON PremiumFeatureUniqueStickers
      = A.object
        [ "@type" A..= AT.String "premiumFeatureUniqueStickers"
        ]
  toJSON PremiumFeatureCustomEmoji
      = A.object
        [ "@type" A..= AT.String "premiumFeatureCustomEmoji"
        ]
  toJSON PremiumFeatureAdvancedChatManagement
      = A.object
        [ "@type" A..= AT.String "premiumFeatureAdvancedChatManagement"
        ]
  toJSON PremiumFeatureProfileBadge
      = A.object
        [ "@type" A..= AT.String "premiumFeatureProfileBadge"
        ]
  toJSON PremiumFeatureEmojiStatus
      = A.object
        [ "@type" A..= AT.String "premiumFeatureEmojiStatus"
        ]
  toJSON PremiumFeatureAnimatedProfilePhoto
      = A.object
        [ "@type" A..= AT.String "premiumFeatureAnimatedProfilePhoto"
        ]
  toJSON PremiumFeatureForumTopicIcon
      = A.object
        [ "@type" A..= AT.String "premiumFeatureForumTopicIcon"
        ]
  toJSON PremiumFeatureAppIcons
      = A.object
        [ "@type" A..= AT.String "premiumFeatureAppIcons"
        ]
  toJSON PremiumFeatureRealTimeChatTranslation
      = A.object
        [ "@type" A..= AT.String "premiumFeatureRealTimeChatTranslation"
        ]
  toJSON PremiumFeatureUpgradedStories
      = A.object
        [ "@type" A..= AT.String "premiumFeatureUpgradedStories"
        ]
  toJSON PremiumFeatureChatBoost
      = A.object
        [ "@type" A..= AT.String "premiumFeatureChatBoost"
        ]
  toJSON PremiumFeatureAccentColor
      = A.object
        [ "@type" A..= AT.String "premiumFeatureAccentColor"
        ]
  toJSON PremiumFeatureBackgroundForBoth
      = A.object
        [ "@type" A..= AT.String "premiumFeatureBackgroundForBoth"
        ]

