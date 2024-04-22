module TD.Data.PremiumLimitType
  (PremiumLimitType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of limit, increased for Premium users
data PremiumLimitType
  = PremiumLimitTypeSupergroupCount -- ^ The maximum number of joined supergroups and channels
  | PremiumLimitTypePinnedChatCount -- ^ The maximum number of pinned chats in the main chat list
  | PremiumLimitTypeCreatedPublicChatCount -- ^ The maximum number of created public chats
  | PremiumLimitTypeSavedAnimationCount -- ^ The maximum number of saved animations
  | PremiumLimitTypeFavoriteStickerCount -- ^ The maximum number of favorite stickers
  | PremiumLimitTypeChatFolderCount -- ^ The maximum number of chat folders
  | PremiumLimitTypeChatFolderChosenChatCount -- ^ The maximum number of pinned and always included, or always excluded chats in a chat folder
  | PremiumLimitTypePinnedArchivedChatCount -- ^ The maximum number of pinned chats in the archive chat list
  | PremiumLimitTypePinnedSavedMessagesTopicCount -- ^ The maximum number of pinned Saved Messages topics
  | PremiumLimitTypeCaptionLength -- ^ The maximum length of sent media caption
  | PremiumLimitTypeBioLength -- ^ The maximum length of the user's bio
  | PremiumLimitTypeChatFolderInviteLinkCount -- ^ The maximum number of invite links for a chat folder
  | PremiumLimitTypeShareableChatFolderCount -- ^ The maximum number of added shareable chat folders
  | PremiumLimitTypeActiveStoryCount -- ^ The maximum number of active stories
  | PremiumLimitTypeWeeklySentStoryCount -- ^ The maximum number of stories sent per week
  | PremiumLimitTypeMonthlySentStoryCount -- ^ The maximum number of stories sent per month
  | PremiumLimitTypeStoryCaptionLength -- ^ The maximum length of captions of sent stories
  | PremiumLimitTypeStorySuggestedReactionAreaCount -- ^ The maximum number of suggested reaction areas on a story
  | PremiumLimitTypeSimilarChatCount -- ^ The maximum number of received similar chats
  deriving (Eq, Show)

instance I.ShortShow PremiumLimitType where
  shortShow PremiumLimitTypeSupergroupCount
      = "PremiumLimitTypeSupergroupCount"
  shortShow PremiumLimitTypePinnedChatCount
      = "PremiumLimitTypePinnedChatCount"
  shortShow PremiumLimitTypeCreatedPublicChatCount
      = "PremiumLimitTypeCreatedPublicChatCount"
  shortShow PremiumLimitTypeSavedAnimationCount
      = "PremiumLimitTypeSavedAnimationCount"
  shortShow PremiumLimitTypeFavoriteStickerCount
      = "PremiumLimitTypeFavoriteStickerCount"
  shortShow PremiumLimitTypeChatFolderCount
      = "PremiumLimitTypeChatFolderCount"
  shortShow PremiumLimitTypeChatFolderChosenChatCount
      = "PremiumLimitTypeChatFolderChosenChatCount"
  shortShow PremiumLimitTypePinnedArchivedChatCount
      = "PremiumLimitTypePinnedArchivedChatCount"
  shortShow PremiumLimitTypePinnedSavedMessagesTopicCount
      = "PremiumLimitTypePinnedSavedMessagesTopicCount"
  shortShow PremiumLimitTypeCaptionLength
      = "PremiumLimitTypeCaptionLength"
  shortShow PremiumLimitTypeBioLength
      = "PremiumLimitTypeBioLength"
  shortShow PremiumLimitTypeChatFolderInviteLinkCount
      = "PremiumLimitTypeChatFolderInviteLinkCount"
  shortShow PremiumLimitTypeShareableChatFolderCount
      = "PremiumLimitTypeShareableChatFolderCount"
  shortShow PremiumLimitTypeActiveStoryCount
      = "PremiumLimitTypeActiveStoryCount"
  shortShow PremiumLimitTypeWeeklySentStoryCount
      = "PremiumLimitTypeWeeklySentStoryCount"
  shortShow PremiumLimitTypeMonthlySentStoryCount
      = "PremiumLimitTypeMonthlySentStoryCount"
  shortShow PremiumLimitTypeStoryCaptionLength
      = "PremiumLimitTypeStoryCaptionLength"
  shortShow PremiumLimitTypeStorySuggestedReactionAreaCount
      = "PremiumLimitTypeStorySuggestedReactionAreaCount"
  shortShow PremiumLimitTypeSimilarChatCount
      = "PremiumLimitTypeSimilarChatCount"

instance AT.FromJSON PremiumLimitType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumLimitTypeSupergroupCount"                 -> pure PremiumLimitTypeSupergroupCount
      "premiumLimitTypePinnedChatCount"                 -> pure PremiumLimitTypePinnedChatCount
      "premiumLimitTypeCreatedPublicChatCount"          -> pure PremiumLimitTypeCreatedPublicChatCount
      "premiumLimitTypeSavedAnimationCount"             -> pure PremiumLimitTypeSavedAnimationCount
      "premiumLimitTypeFavoriteStickerCount"            -> pure PremiumLimitTypeFavoriteStickerCount
      "premiumLimitTypeChatFolderCount"                 -> pure PremiumLimitTypeChatFolderCount
      "premiumLimitTypeChatFolderChosenChatCount"       -> pure PremiumLimitTypeChatFolderChosenChatCount
      "premiumLimitTypePinnedArchivedChatCount"         -> pure PremiumLimitTypePinnedArchivedChatCount
      "premiumLimitTypePinnedSavedMessagesTopicCount"   -> pure PremiumLimitTypePinnedSavedMessagesTopicCount
      "premiumLimitTypeCaptionLength"                   -> pure PremiumLimitTypeCaptionLength
      "premiumLimitTypeBioLength"                       -> pure PremiumLimitTypeBioLength
      "premiumLimitTypeChatFolderInviteLinkCount"       -> pure PremiumLimitTypeChatFolderInviteLinkCount
      "premiumLimitTypeShareableChatFolderCount"        -> pure PremiumLimitTypeShareableChatFolderCount
      "premiumLimitTypeActiveStoryCount"                -> pure PremiumLimitTypeActiveStoryCount
      "premiumLimitTypeWeeklySentStoryCount"            -> pure PremiumLimitTypeWeeklySentStoryCount
      "premiumLimitTypeMonthlySentStoryCount"           -> pure PremiumLimitTypeMonthlySentStoryCount
      "premiumLimitTypeStoryCaptionLength"              -> pure PremiumLimitTypeStoryCaptionLength
      "premiumLimitTypeStorySuggestedReactionAreaCount" -> pure PremiumLimitTypeStorySuggestedReactionAreaCount
      "premiumLimitTypeSimilarChatCount"                -> pure PremiumLimitTypeSimilarChatCount
      _                                                 -> mempty
    
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
  toJSON PremiumLimitTypePinnedSavedMessagesTopicCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypePinnedSavedMessagesTopicCount"
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
  toJSON PremiumLimitTypeWeeklySentStoryCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeWeeklySentStoryCount"
        ]
  toJSON PremiumLimitTypeMonthlySentStoryCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeMonthlySentStoryCount"
        ]
  toJSON PremiumLimitTypeStoryCaptionLength
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeStoryCaptionLength"
        ]
  toJSON PremiumLimitTypeStorySuggestedReactionAreaCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeStorySuggestedReactionAreaCount"
        ]
  toJSON PremiumLimitTypeSimilarChatCount
      = A.object
        [ "@type" A..= AT.String "premiumLimitTypeSimilarChatCount"
        ]

