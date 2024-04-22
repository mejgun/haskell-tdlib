module TD.Data.BusinessFeature
  (BusinessFeature(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a feature available to Business user accounts
data BusinessFeature
  = BusinessFeatureLocation -- ^ The ability to set location
  | BusinessFeatureOpeningHours -- ^ The ability to set opening hours
  | BusinessFeatureQuickReplies -- ^ The ability to use quick replies
  | BusinessFeatureGreetingMessage -- ^ The ability to set up a greeting message
  | BusinessFeatureAwayMessage -- ^ The ability to set up an away message
  | BusinessFeatureAccountLinks -- ^ The ability to create links to the business account with predefined message text
  | BusinessFeatureStartPage -- ^ The ability to customize start page
  | BusinessFeatureBots -- ^ The ability to connect a bot to the account
  | BusinessFeatureEmojiStatus -- ^ The ability to show an emoji status along with the business name
  | BusinessFeatureChatFolderTags -- ^ The ability to display folder names for each chat in the chat list
  | BusinessFeatureUpgradedStories -- ^ Allowed to use many additional features for stories
  deriving (Eq, Show)

instance I.ShortShow BusinessFeature where
  shortShow BusinessFeatureLocation
      = "BusinessFeatureLocation"
  shortShow BusinessFeatureOpeningHours
      = "BusinessFeatureOpeningHours"
  shortShow BusinessFeatureQuickReplies
      = "BusinessFeatureQuickReplies"
  shortShow BusinessFeatureGreetingMessage
      = "BusinessFeatureGreetingMessage"
  shortShow BusinessFeatureAwayMessage
      = "BusinessFeatureAwayMessage"
  shortShow BusinessFeatureAccountLinks
      = "BusinessFeatureAccountLinks"
  shortShow BusinessFeatureStartPage
      = "BusinessFeatureStartPage"
  shortShow BusinessFeatureBots
      = "BusinessFeatureBots"
  shortShow BusinessFeatureEmojiStatus
      = "BusinessFeatureEmojiStatus"
  shortShow BusinessFeatureChatFolderTags
      = "BusinessFeatureChatFolderTags"
  shortShow BusinessFeatureUpgradedStories
      = "BusinessFeatureUpgradedStories"

instance AT.FromJSON BusinessFeature where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessFeatureLocation"        -> pure BusinessFeatureLocation
      "businessFeatureOpeningHours"    -> pure BusinessFeatureOpeningHours
      "businessFeatureQuickReplies"    -> pure BusinessFeatureQuickReplies
      "businessFeatureGreetingMessage" -> pure BusinessFeatureGreetingMessage
      "businessFeatureAwayMessage"     -> pure BusinessFeatureAwayMessage
      "businessFeatureAccountLinks"    -> pure BusinessFeatureAccountLinks
      "businessFeatureStartPage"       -> pure BusinessFeatureStartPage
      "businessFeatureBots"            -> pure BusinessFeatureBots
      "businessFeatureEmojiStatus"     -> pure BusinessFeatureEmojiStatus
      "businessFeatureChatFolderTags"  -> pure BusinessFeatureChatFolderTags
      "businessFeatureUpgradedStories" -> pure BusinessFeatureUpgradedStories
      _                                -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON BusinessFeature where
  toJSON BusinessFeatureLocation
      = A.object
        [ "@type" A..= AT.String "businessFeatureLocation"
        ]
  toJSON BusinessFeatureOpeningHours
      = A.object
        [ "@type" A..= AT.String "businessFeatureOpeningHours"
        ]
  toJSON BusinessFeatureQuickReplies
      = A.object
        [ "@type" A..= AT.String "businessFeatureQuickReplies"
        ]
  toJSON BusinessFeatureGreetingMessage
      = A.object
        [ "@type" A..= AT.String "businessFeatureGreetingMessage"
        ]
  toJSON BusinessFeatureAwayMessage
      = A.object
        [ "@type" A..= AT.String "businessFeatureAwayMessage"
        ]
  toJSON BusinessFeatureAccountLinks
      = A.object
        [ "@type" A..= AT.String "businessFeatureAccountLinks"
        ]
  toJSON BusinessFeatureStartPage
      = A.object
        [ "@type" A..= AT.String "businessFeatureStartPage"
        ]
  toJSON BusinessFeatureBots
      = A.object
        [ "@type" A..= AT.String "businessFeatureBots"
        ]
  toJSON BusinessFeatureEmojiStatus
      = A.object
        [ "@type" A..= AT.String "businessFeatureEmojiStatus"
        ]
  toJSON BusinessFeatureChatFolderTags
      = A.object
        [ "@type" A..= AT.String "businessFeatureChatFolderTags"
        ]
  toJSON BusinessFeatureUpgradedStories
      = A.object
        [ "@type" A..= AT.String "businessFeatureUpgradedStories"
        ]

