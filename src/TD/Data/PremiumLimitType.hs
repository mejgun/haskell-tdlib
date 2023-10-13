module TD.Data.PremiumLimitType
  (PremiumLimitType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Describes type of a limit, increased for Premium users
data PremiumLimitType
  = PremiumLimitTypeSupergroupCount -- ^ The maximum number of joined supergroups and channels
  | PremiumLimitTypePinnedChatCount -- ^ The maximum number of pinned chats in the main chat list
  | PremiumLimitTypeCreatedPublicChatCount -- ^ The maximum number of created public chats
  | PremiumLimitTypeSavedAnimationCount -- ^ The maximum number of saved animations
  | PremiumLimitTypeFavoriteStickerCount -- ^ The maximum number of favorite stickers
  | PremiumLimitTypeChatFolderCount -- ^ The maximum number of chat folders
  | PremiumLimitTypeChatFolderChosenChatCount -- ^ The maximum number of pinned and always included, or always excluded chats in a chat folder
  | PremiumLimitTypePinnedArchivedChatCount -- ^ The maximum number of pinned chats in the archive chat list
  | PremiumLimitTypeCaptionLength -- ^ The maximum length of sent media caption
  | PremiumLimitTypeBioLength -- ^ The maximum length of the user's bio
  | PremiumLimitTypeChatFolderInviteLinkCount -- ^ The maximum number of invite links for a chat folder
  | PremiumLimitTypeShareableChatFolderCount -- ^ The maximum number of added shareable chat folders
  | PremiumLimitTypeActiveStoryCount -- ^ The maximum number of active stories
  deriving (Eq)

instance Show PremiumLimitType where
  show PremiumLimitTypeSupergroupCount
      = "PremiumLimitTypeSupergroupCount"
  show PremiumLimitTypePinnedChatCount
      = "PremiumLimitTypePinnedChatCount"
  show PremiumLimitTypeCreatedPublicChatCount
      = "PremiumLimitTypeCreatedPublicChatCount"
  show PremiumLimitTypeSavedAnimationCount
      = "PremiumLimitTypeSavedAnimationCount"
  show PremiumLimitTypeFavoriteStickerCount
      = "PremiumLimitTypeFavoriteStickerCount"
  show PremiumLimitTypeChatFolderCount
      = "PremiumLimitTypeChatFolderCount"
  show PremiumLimitTypeChatFolderChosenChatCount
      = "PremiumLimitTypeChatFolderChosenChatCount"
  show PremiumLimitTypePinnedArchivedChatCount
      = "PremiumLimitTypePinnedArchivedChatCount"
  show PremiumLimitTypeCaptionLength
      = "PremiumLimitTypeCaptionLength"
  show PremiumLimitTypeBioLength
      = "PremiumLimitTypeBioLength"
  show PremiumLimitTypeChatFolderInviteLinkCount
      = "PremiumLimitTypeChatFolderInviteLinkCount"
  show PremiumLimitTypeShareableChatFolderCount
      = "PremiumLimitTypeShareableChatFolderCount"
  show PremiumLimitTypeActiveStoryCount
      = "PremiumLimitTypeActiveStoryCount"

instance AT.FromJSON PremiumLimitType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumLimitTypeSupergroupCount"           -> pure PremiumLimitTypeSupergroupCount
      "premiumLimitTypePinnedChatCount"           -> pure PremiumLimitTypePinnedChatCount
      "premiumLimitTypeCreatedPublicChatCount"    -> pure PremiumLimitTypeCreatedPublicChatCount
      "premiumLimitTypeSavedAnimationCount"       -> pure PremiumLimitTypeSavedAnimationCount
      "premiumLimitTypeFavoriteStickerCount"      -> pure PremiumLimitTypeFavoriteStickerCount
      "premiumLimitTypeChatFolderCount"           -> pure PremiumLimitTypeChatFolderCount
      "premiumLimitTypeChatFolderChosenChatCount" -> pure PremiumLimitTypeChatFolderChosenChatCount
      "premiumLimitTypePinnedArchivedChatCount"   -> pure PremiumLimitTypePinnedArchivedChatCount
      "premiumLimitTypeCaptionLength"             -> pure PremiumLimitTypeCaptionLength
      "premiumLimitTypeBioLength"                 -> pure PremiumLimitTypeBioLength
      "premiumLimitTypeChatFolderInviteLinkCount" -> pure PremiumLimitTypeChatFolderInviteLinkCount
      "premiumLimitTypeShareableChatFolderCount"  -> pure PremiumLimitTypeShareableChatFolderCount
      "premiumLimitTypeActiveStoryCount"          -> pure PremiumLimitTypeActiveStoryCount
      _                                           -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON PremiumLimitType where
  toJSON PremiumLimitTypeSupergroupCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeSupergroupCount"
        ]
  toJSON PremiumLimitTypePinnedChatCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypePinnedChatCount"
        ]
  toJSON PremiumLimitTypeCreatedPublicChatCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeCreatedPublicChatCount"
        ]
  toJSON PremiumLimitTypeSavedAnimationCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeSavedAnimationCount"
        ]
  toJSON PremiumLimitTypeFavoriteStickerCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeFavoriteStickerCount"
        ]
  toJSON PremiumLimitTypeChatFolderCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeChatFolderCount"
        ]
  toJSON PremiumLimitTypeChatFolderChosenChatCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeChatFolderChosenChatCount"
        ]
  toJSON PremiumLimitTypePinnedArchivedChatCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypePinnedArchivedChatCount"
        ]
  toJSON PremiumLimitTypeCaptionLength
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeCaptionLength"
        ]
  toJSON PremiumLimitTypeBioLength
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeBioLength"
        ]
  toJSON PremiumLimitTypeChatFolderInviteLinkCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeChatFolderInviteLinkCount"
        ]
  toJSON PremiumLimitTypeShareableChatFolderCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeShareableChatFolderCount"
        ]
  toJSON PremiumLimitTypeActiveStoryCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeActiveStoryCount"
        ]

