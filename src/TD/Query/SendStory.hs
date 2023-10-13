module TD.Query.SendStory(SendStory(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings

data SendStory -- ^ Sends a new story. Returns a temporary story with identifier 0
  = SendStory
    { content          :: Maybe InputStoryContent.InputStoryContent       -- ^ Content of the story
    , caption          :: Maybe FormattedText.FormattedText               -- ^ Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters
    , privacy_settings :: Maybe StoryPrivacySettings.StoryPrivacySettings -- ^ The privacy settings for the story
    , active_period    :: Maybe Int                                       -- ^ Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, 2 * 86400, 3 * 86400, or 7 * 86400 for Telegram Premium users, and 86400 otherwise
    , is_pinned        :: Maybe Bool                                      -- ^ Pass true to keep the story accessible after expiration
    , protect_content  :: Maybe Bool                                      -- ^ Pass true if the content of the story must be protected from forwarding and screenshotting
    }
  deriving (Eq)

instance Show SendStory where
  show
    SendStory
      { content          = content_
      , caption          = caption_
      , privacy_settings = privacy_settings_
      , active_period    = active_period_
      , is_pinned        = is_pinned_
      , protect_content  = protect_content_
      }
        = "SendStory"
          ++ I.cc
          [ "content"          `I.p` content_
          , "caption"          `I.p` caption_
          , "privacy_settings" `I.p` privacy_settings_
          , "active_period"    `I.p` active_period_
          , "is_pinned"        `I.p` is_pinned_
          , "protect_content"  `I.p` protect_content_
          ]

instance AT.ToJSON SendStory where
  toJSON
    SendStory
      { content          = content_
      , caption          = caption_
      , privacy_settings = privacy_settings_
      , active_period    = active_period_
      , is_pinned        = is_pinned_
      , protect_content  = protect_content_
      }
        = A.object
          [ "@type"            A..= AT.String "sendStory"
          , "content"          A..= content_
          , "caption"          A..= caption_
          , "privacy_settings" A..= privacy_settings_
          , "active_period"    A..= active_period_
          , "is_pinned"        A..= is_pinned_
          , "protect_content"  A..= protect_content_
          ]
