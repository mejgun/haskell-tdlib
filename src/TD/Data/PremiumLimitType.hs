{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumLimitType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes type of a limit, increased for Premium users
data PremiumLimitType
  = -- | The maximum number of joined supergroups and channels
    PremiumLimitTypeSupergroupCount
  | -- | The maximum number of pinned chats in the main chat list
    PremiumLimitTypePinnedChatCount
  | -- | The maximum number of created public chats
    PremiumLimitTypeCreatedPublicChatCount
  | -- | The maximum number of saved animations
    PremiumLimitTypeSavedAnimationCount
  | -- | The maximum number of favorite stickers
    PremiumLimitTypeFavoriteStickerCount
  | -- | The maximum number of chat folders
    PremiumLimitTypeChatFolderCount
  | -- | The maximum number of pinned and always included, or always excluded chats in a chat folder
    PremiumLimitTypeChatFolderChosenChatCount
  | -- | The maximum number of pinned chats in the archive chat list
    PremiumLimitTypePinnedArchivedChatCount
  | -- | The maximum length of sent media caption
    PremiumLimitTypeCaptionLength
  | -- | The maximum length of the user's bio
    PremiumLimitTypeBioLength
  | -- | The maximum number of invite links for a chat folder
    PremiumLimitTypeChatFolderInviteLinkCount
  | -- | The maximum number of added shareable chat folders
    PremiumLimitTypeShareableChatFolderCount
  | -- | The maximum number of active stories
    PremiumLimitTypeActiveStoryCount
  deriving (Eq)

instance Show PremiumLimitType where
  show PremiumLimitTypeSupergroupCount =
    "PremiumLimitTypeSupergroupCount"
      ++ U.cc
        []
  show PremiumLimitTypePinnedChatCount =
    "PremiumLimitTypePinnedChatCount"
      ++ U.cc
        []
  show PremiumLimitTypeCreatedPublicChatCount =
    "PremiumLimitTypeCreatedPublicChatCount"
      ++ U.cc
        []
  show PremiumLimitTypeSavedAnimationCount =
    "PremiumLimitTypeSavedAnimationCount"
      ++ U.cc
        []
  show PremiumLimitTypeFavoriteStickerCount =
    "PremiumLimitTypeFavoriteStickerCount"
      ++ U.cc
        []
  show PremiumLimitTypeChatFolderCount =
    "PremiumLimitTypeChatFolderCount"
      ++ U.cc
        []
  show PremiumLimitTypeChatFolderChosenChatCount =
    "PremiumLimitTypeChatFolderChosenChatCount"
      ++ U.cc
        []
  show PremiumLimitTypePinnedArchivedChatCount =
    "PremiumLimitTypePinnedArchivedChatCount"
      ++ U.cc
        []
  show PremiumLimitTypeCaptionLength =
    "PremiumLimitTypeCaptionLength"
      ++ U.cc
        []
  show PremiumLimitTypeBioLength =
    "PremiumLimitTypeBioLength"
      ++ U.cc
        []
  show PremiumLimitTypeChatFolderInviteLinkCount =
    "PremiumLimitTypeChatFolderInviteLinkCount"
      ++ U.cc
        []
  show PremiumLimitTypeShareableChatFolderCount =
    "PremiumLimitTypeShareableChatFolderCount"
      ++ U.cc
        []
  show PremiumLimitTypeActiveStoryCount =
    "PremiumLimitTypeActiveStoryCount"
      ++ U.cc
        []

instance T.FromJSON PremiumLimitType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumLimitTypeSupergroupCount" -> parsePremiumLimitTypeSupergroupCount v
      "premiumLimitTypePinnedChatCount" -> parsePremiumLimitTypePinnedChatCount v
      "premiumLimitTypeCreatedPublicChatCount" -> parsePremiumLimitTypeCreatedPublicChatCount v
      "premiumLimitTypeSavedAnimationCount" -> parsePremiumLimitTypeSavedAnimationCount v
      "premiumLimitTypeFavoriteStickerCount" -> parsePremiumLimitTypeFavoriteStickerCount v
      "premiumLimitTypeChatFolderCount" -> parsePremiumLimitTypeChatFolderCount v
      "premiumLimitTypeChatFolderChosenChatCount" -> parsePremiumLimitTypeChatFolderChosenChatCount v
      "premiumLimitTypePinnedArchivedChatCount" -> parsePremiumLimitTypePinnedArchivedChatCount v
      "premiumLimitTypeCaptionLength" -> parsePremiumLimitTypeCaptionLength v
      "premiumLimitTypeBioLength" -> parsePremiumLimitTypeBioLength v
      "premiumLimitTypeChatFolderInviteLinkCount" -> parsePremiumLimitTypeChatFolderInviteLinkCount v
      "premiumLimitTypeShareableChatFolderCount" -> parsePremiumLimitTypeShareableChatFolderCount v
      "premiumLimitTypeActiveStoryCount" -> parsePremiumLimitTypeActiveStoryCount v
      _ -> mempty
    where
      parsePremiumLimitTypeSupergroupCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeSupergroupCount = A.withObject "PremiumLimitTypeSupergroupCount" $ \_ -> return PremiumLimitTypeSupergroupCount

      parsePremiumLimitTypePinnedChatCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypePinnedChatCount = A.withObject "PremiumLimitTypePinnedChatCount" $ \_ -> return PremiumLimitTypePinnedChatCount

      parsePremiumLimitTypeCreatedPublicChatCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeCreatedPublicChatCount = A.withObject "PremiumLimitTypeCreatedPublicChatCount" $ \_ -> return PremiumLimitTypeCreatedPublicChatCount

      parsePremiumLimitTypeSavedAnimationCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeSavedAnimationCount = A.withObject "PremiumLimitTypeSavedAnimationCount" $ \_ -> return PremiumLimitTypeSavedAnimationCount

      parsePremiumLimitTypeFavoriteStickerCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeFavoriteStickerCount = A.withObject "PremiumLimitTypeFavoriteStickerCount" $ \_ -> return PremiumLimitTypeFavoriteStickerCount

      parsePremiumLimitTypeChatFolderCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeChatFolderCount = A.withObject "PremiumLimitTypeChatFolderCount" $ \_ -> return PremiumLimitTypeChatFolderCount

      parsePremiumLimitTypeChatFolderChosenChatCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeChatFolderChosenChatCount = A.withObject "PremiumLimitTypeChatFolderChosenChatCount" $ \_ -> return PremiumLimitTypeChatFolderChosenChatCount

      parsePremiumLimitTypePinnedArchivedChatCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypePinnedArchivedChatCount = A.withObject "PremiumLimitTypePinnedArchivedChatCount" $ \_ -> return PremiumLimitTypePinnedArchivedChatCount

      parsePremiumLimitTypeCaptionLength :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeCaptionLength = A.withObject "PremiumLimitTypeCaptionLength" $ \_ -> return PremiumLimitTypeCaptionLength

      parsePremiumLimitTypeBioLength :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeBioLength = A.withObject "PremiumLimitTypeBioLength" $ \_ -> return PremiumLimitTypeBioLength

      parsePremiumLimitTypeChatFolderInviteLinkCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeChatFolderInviteLinkCount = A.withObject "PremiumLimitTypeChatFolderInviteLinkCount" $ \_ -> return PremiumLimitTypeChatFolderInviteLinkCount

      parsePremiumLimitTypeShareableChatFolderCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeShareableChatFolderCount = A.withObject "PremiumLimitTypeShareableChatFolderCount" $ \_ -> return PremiumLimitTypeShareableChatFolderCount

      parsePremiumLimitTypeActiveStoryCount :: A.Value -> T.Parser PremiumLimitType
      parsePremiumLimitTypeActiveStoryCount = A.withObject "PremiumLimitTypeActiveStoryCount" $ \_ -> return PremiumLimitTypeActiveStoryCount
  parseJSON _ = mempty

instance T.ToJSON PremiumLimitType where
  toJSON PremiumLimitTypeSupergroupCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeSupergroupCount"
      ]
  toJSON PremiumLimitTypePinnedChatCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypePinnedChatCount"
      ]
  toJSON PremiumLimitTypeCreatedPublicChatCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeCreatedPublicChatCount"
      ]
  toJSON PremiumLimitTypeSavedAnimationCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeSavedAnimationCount"
      ]
  toJSON PremiumLimitTypeFavoriteStickerCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeFavoriteStickerCount"
      ]
  toJSON PremiumLimitTypeChatFolderCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeChatFolderCount"
      ]
  toJSON PremiumLimitTypeChatFolderChosenChatCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeChatFolderChosenChatCount"
      ]
  toJSON PremiumLimitTypePinnedArchivedChatCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypePinnedArchivedChatCount"
      ]
  toJSON PremiumLimitTypeCaptionLength =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeCaptionLength"
      ]
  toJSON PremiumLimitTypeBioLength =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeBioLength"
      ]
  toJSON PremiumLimitTypeChatFolderInviteLinkCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeChatFolderInviteLinkCount"
      ]
  toJSON PremiumLimitTypeShareableChatFolderCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeShareableChatFolderCount"
      ]
  toJSON PremiumLimitTypeActiveStoryCount =
    A.object
      [ "@type" A..= T.String "premiumLimitTypeActiveStoryCount"
      ]
