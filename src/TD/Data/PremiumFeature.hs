{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumFeature where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a feature available to Premium users
data PremiumFeature
  = -- | Increased limits
    PremiumFeatureIncreasedLimits
  | -- | Increased maximum upload file size
    PremiumFeatureIncreasedUploadFileSize
  | -- | Improved download speed
    PremiumFeatureImprovedDownloadSpeed
  | -- | The ability to convert voice notes to text
    PremiumFeatureVoiceRecognition
  | -- | Disabled ads
    PremiumFeatureDisabledAds
  | -- | Allowed to use more reactions
    PremiumFeatureUniqueReactions
  | -- | Allowed to use premium stickers with unique effects
    PremiumFeatureUniqueStickers
  | -- | Allowed to use custom emoji stickers in message texts and captions
    PremiumFeatureCustomEmoji
  | -- | Ability to change position of the main chat list, archive and mute all new chats from non-contacts, and completely disable notifications about the user's contacts joined Telegram
    PremiumFeatureAdvancedChatManagement
  | -- | A badge in the user's profile
    PremiumFeatureProfileBadge
  | -- | A emoji status shown along with the user's name
    PremiumFeatureEmojiStatus
  | -- | Profile photo animation on message and chat screens
    PremiumFeatureAnimatedProfilePhoto
  | -- | The ability to set a custom emoji as a forum topic icon
    PremiumFeatureForumTopicIcon
  | -- | Allowed to set a premium appllication icons
    PremiumFeatureAppIcons
  deriving (Eq)

instance Show PremiumFeature where
  show PremiumFeatureIncreasedLimits =
    "PremiumFeatureIncreasedLimits"
      ++ U.cc
        []
  show PremiumFeatureIncreasedUploadFileSize =
    "PremiumFeatureIncreasedUploadFileSize"
      ++ U.cc
        []
  show PremiumFeatureImprovedDownloadSpeed =
    "PremiumFeatureImprovedDownloadSpeed"
      ++ U.cc
        []
  show PremiumFeatureVoiceRecognition =
    "PremiumFeatureVoiceRecognition"
      ++ U.cc
        []
  show PremiumFeatureDisabledAds =
    "PremiumFeatureDisabledAds"
      ++ U.cc
        []
  show PremiumFeatureUniqueReactions =
    "PremiumFeatureUniqueReactions"
      ++ U.cc
        []
  show PremiumFeatureUniqueStickers =
    "PremiumFeatureUniqueStickers"
      ++ U.cc
        []
  show PremiumFeatureCustomEmoji =
    "PremiumFeatureCustomEmoji"
      ++ U.cc
        []
  show PremiumFeatureAdvancedChatManagement =
    "PremiumFeatureAdvancedChatManagement"
      ++ U.cc
        []
  show PremiumFeatureProfileBadge =
    "PremiumFeatureProfileBadge"
      ++ U.cc
        []
  show PremiumFeatureEmojiStatus =
    "PremiumFeatureEmojiStatus"
      ++ U.cc
        []
  show PremiumFeatureAnimatedProfilePhoto =
    "PremiumFeatureAnimatedProfilePhoto"
      ++ U.cc
        []
  show PremiumFeatureForumTopicIcon =
    "PremiumFeatureForumTopicIcon"
      ++ U.cc
        []
  show PremiumFeatureAppIcons =
    "PremiumFeatureAppIcons"
      ++ U.cc
        []

instance T.FromJSON PremiumFeature where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumFeatureIncreasedLimits" -> parsePremiumFeatureIncreasedLimits v
      "premiumFeatureIncreasedUploadFileSize" -> parsePremiumFeatureIncreasedUploadFileSize v
      "premiumFeatureImprovedDownloadSpeed" -> parsePremiumFeatureImprovedDownloadSpeed v
      "premiumFeatureVoiceRecognition" -> parsePremiumFeatureVoiceRecognition v
      "premiumFeatureDisabledAds" -> parsePremiumFeatureDisabledAds v
      "premiumFeatureUniqueReactions" -> parsePremiumFeatureUniqueReactions v
      "premiumFeatureUniqueStickers" -> parsePremiumFeatureUniqueStickers v
      "premiumFeatureCustomEmoji" -> parsePremiumFeatureCustomEmoji v
      "premiumFeatureAdvancedChatManagement" -> parsePremiumFeatureAdvancedChatManagement v
      "premiumFeatureProfileBadge" -> parsePremiumFeatureProfileBadge v
      "premiumFeatureEmojiStatus" -> parsePremiumFeatureEmojiStatus v
      "premiumFeatureAnimatedProfilePhoto" -> parsePremiumFeatureAnimatedProfilePhoto v
      "premiumFeatureForumTopicIcon" -> parsePremiumFeatureForumTopicIcon v
      "premiumFeatureAppIcons" -> parsePremiumFeatureAppIcons v
      _ -> mempty
    where
      parsePremiumFeatureIncreasedLimits :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureIncreasedLimits = A.withObject "PremiumFeatureIncreasedLimits" $ \_ -> return PremiumFeatureIncreasedLimits

      parsePremiumFeatureIncreasedUploadFileSize :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureIncreasedUploadFileSize = A.withObject "PremiumFeatureIncreasedUploadFileSize" $ \_ -> return PremiumFeatureIncreasedUploadFileSize

      parsePremiumFeatureImprovedDownloadSpeed :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureImprovedDownloadSpeed = A.withObject "PremiumFeatureImprovedDownloadSpeed" $ \_ -> return PremiumFeatureImprovedDownloadSpeed

      parsePremiumFeatureVoiceRecognition :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureVoiceRecognition = A.withObject "PremiumFeatureVoiceRecognition" $ \_ -> return PremiumFeatureVoiceRecognition

      parsePremiumFeatureDisabledAds :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureDisabledAds = A.withObject "PremiumFeatureDisabledAds" $ \_ -> return PremiumFeatureDisabledAds

      parsePremiumFeatureUniqueReactions :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureUniqueReactions = A.withObject "PremiumFeatureUniqueReactions" $ \_ -> return PremiumFeatureUniqueReactions

      parsePremiumFeatureUniqueStickers :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureUniqueStickers = A.withObject "PremiumFeatureUniqueStickers" $ \_ -> return PremiumFeatureUniqueStickers

      parsePremiumFeatureCustomEmoji :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureCustomEmoji = A.withObject "PremiumFeatureCustomEmoji" $ \_ -> return PremiumFeatureCustomEmoji

      parsePremiumFeatureAdvancedChatManagement :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureAdvancedChatManagement = A.withObject "PremiumFeatureAdvancedChatManagement" $ \_ -> return PremiumFeatureAdvancedChatManagement

      parsePremiumFeatureProfileBadge :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureProfileBadge = A.withObject "PremiumFeatureProfileBadge" $ \_ -> return PremiumFeatureProfileBadge

      parsePremiumFeatureEmojiStatus :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureEmojiStatus = A.withObject "PremiumFeatureEmojiStatus" $ \_ -> return PremiumFeatureEmojiStatus

      parsePremiumFeatureAnimatedProfilePhoto :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureAnimatedProfilePhoto = A.withObject "PremiumFeatureAnimatedProfilePhoto" $ \_ -> return PremiumFeatureAnimatedProfilePhoto

      parsePremiumFeatureForumTopicIcon :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureForumTopicIcon = A.withObject "PremiumFeatureForumTopicIcon" $ \_ -> return PremiumFeatureForumTopicIcon

      parsePremiumFeatureAppIcons :: A.Value -> T.Parser PremiumFeature
      parsePremiumFeatureAppIcons = A.withObject "PremiumFeatureAppIcons" $ \_ -> return PremiumFeatureAppIcons
  parseJSON _ = mempty

instance T.ToJSON PremiumFeature where
  toJSON PremiumFeatureIncreasedLimits =
    A.object
      [ "@type" A..= T.String "premiumFeatureIncreasedLimits"
      ]
  toJSON PremiumFeatureIncreasedUploadFileSize =
    A.object
      [ "@type" A..= T.String "premiumFeatureIncreasedUploadFileSize"
      ]
  toJSON PremiumFeatureImprovedDownloadSpeed =
    A.object
      [ "@type" A..= T.String "premiumFeatureImprovedDownloadSpeed"
      ]
  toJSON PremiumFeatureVoiceRecognition =
    A.object
      [ "@type" A..= T.String "premiumFeatureVoiceRecognition"
      ]
  toJSON PremiumFeatureDisabledAds =
    A.object
      [ "@type" A..= T.String "premiumFeatureDisabledAds"
      ]
  toJSON PremiumFeatureUniqueReactions =
    A.object
      [ "@type" A..= T.String "premiumFeatureUniqueReactions"
      ]
  toJSON PremiumFeatureUniqueStickers =
    A.object
      [ "@type" A..= T.String "premiumFeatureUniqueStickers"
      ]
  toJSON PremiumFeatureCustomEmoji =
    A.object
      [ "@type" A..= T.String "premiumFeatureCustomEmoji"
      ]
  toJSON PremiumFeatureAdvancedChatManagement =
    A.object
      [ "@type" A..= T.String "premiumFeatureAdvancedChatManagement"
      ]
  toJSON PremiumFeatureProfileBadge =
    A.object
      [ "@type" A..= T.String "premiumFeatureProfileBadge"
      ]
  toJSON PremiumFeatureEmojiStatus =
    A.object
      [ "@type" A..= T.String "premiumFeatureEmojiStatus"
      ]
  toJSON PremiumFeatureAnimatedProfilePhoto =
    A.object
      [ "@type" A..= T.String "premiumFeatureAnimatedProfilePhoto"
      ]
  toJSON PremiumFeatureForumTopicIcon =
    A.object
      [ "@type" A..= T.String "premiumFeatureForumTopicIcon"
      ]
  toJSON PremiumFeatureAppIcons =
    A.object
      [ "@type" A..= T.String "premiumFeatureAppIcons"
      ]
