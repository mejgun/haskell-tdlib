module TD.Data.PremiumFeature
  ( PremiumFeature(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

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
  | PremiumFeatureEmojiStatus -- ^ A emoji status shown along with the user's name
  | PremiumFeatureAnimatedProfilePhoto -- ^ Profile photo animation on message and chat screens
  | PremiumFeatureForumTopicIcon -- ^ The ability to set a custom emoji as a forum topic icon
  | PremiumFeatureAppIcons -- ^ Allowed to set a premium application icons
  | PremiumFeatureRealTimeChatTranslation -- ^ Allowed to translate chat messages real-time
  deriving (Eq)

instance Show PremiumFeature where
  show PremiumFeatureIncreasedLimits
      = "PremiumFeatureIncreasedLimits"
  show PremiumFeatureIncreasedUploadFileSize
      = "PremiumFeatureIncreasedUploadFileSize"
  show PremiumFeatureImprovedDownloadSpeed
      = "PremiumFeatureImprovedDownloadSpeed"
  show PremiumFeatureVoiceRecognition
      = "PremiumFeatureVoiceRecognition"
  show PremiumFeatureDisabledAds
      = "PremiumFeatureDisabledAds"
  show PremiumFeatureUniqueReactions
      = "PremiumFeatureUniqueReactions"
  show PremiumFeatureUniqueStickers
      = "PremiumFeatureUniqueStickers"
  show PremiumFeatureCustomEmoji
      = "PremiumFeatureCustomEmoji"
  show PremiumFeatureAdvancedChatManagement
      = "PremiumFeatureAdvancedChatManagement"
  show PremiumFeatureProfileBadge
      = "PremiumFeatureProfileBadge"
  show PremiumFeatureEmojiStatus
      = "PremiumFeatureEmojiStatus"
  show PremiumFeatureAnimatedProfilePhoto
      = "PremiumFeatureAnimatedProfilePhoto"
  show PremiumFeatureForumTopicIcon
      = "PremiumFeatureForumTopicIcon"
  show PremiumFeatureAppIcons
      = "PremiumFeatureAppIcons"
  show PremiumFeatureRealTimeChatTranslation
      = "PremiumFeatureRealTimeChatTranslation"

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

