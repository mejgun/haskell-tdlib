module TD.Query.SendStory
  (SendStory(..)
  , defaultSendStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified TD.Data.InputStoryAreas as InputStoryAreas
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings
import qualified TD.Data.StoryFullId as StoryFullId

-- | Sends a new story to a chat; requires can_post_stories right for supergroup and channel chats. Returns a temporary story. Returns 'TD.Data.Story.Story'
data SendStory
  = SendStory
    { chat_id                :: Maybe Int                                       -- ^ Identifier of the chat that will post the story. Pass Saved Messages chat identifier when posting a story on behalf of the current user
    , content                :: Maybe InputStoryContent.InputStoryContent       -- ^ Content of the story
    , areas                  :: Maybe InputStoryAreas.InputStoryAreas           -- ^ Clickable rectangle areas to be shown on the story media; pass null if none
    , caption                :: Maybe FormattedText.FormattedText               -- ^ Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters; can have entities only if getOption("can_use_text_entities_in_story_caption")
    , privacy_settings       :: Maybe StoryPrivacySettings.StoryPrivacySettings -- ^ The privacy settings for the story; ignored for stories sent to supergroup and channel chats
    , active_period          :: Maybe Int                                       -- ^ Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise
    , from_story_full_id     :: Maybe StoryFullId.StoryFullId                   -- ^ Full identifier of the original story, which content was used to create the story; pass null if the story isn't repost of another story
    , is_posted_to_chat_page :: Maybe Bool                                      -- ^ Pass true to keep the story accessible after expiration
    , protect_content        :: Maybe Bool                                      -- ^ Pass true if the content of the story must be protected from forwarding and screenshotting
    }
  deriving (Eq, Show)

instance I.ShortShow SendStory where
  shortShow
    SendStory
      { chat_id                = chat_id_
      , content                = content_
      , areas                  = areas_
      , caption                = caption_
      , privacy_settings       = privacy_settings_
      , active_period          = active_period_
      , from_story_full_id     = from_story_full_id_
      , is_posted_to_chat_page = is_posted_to_chat_page_
      , protect_content        = protect_content_
      }
        = "SendStory"
          ++ I.cc
          [ "chat_id"                `I.p` chat_id_
          , "content"                `I.p` content_
          , "areas"                  `I.p` areas_
          , "caption"                `I.p` caption_
          , "privacy_settings"       `I.p` privacy_settings_
          , "active_period"          `I.p` active_period_
          , "from_story_full_id"     `I.p` from_story_full_id_
          , "is_posted_to_chat_page" `I.p` is_posted_to_chat_page_
          , "protect_content"        `I.p` protect_content_
          ]

instance AT.ToJSON SendStory where
  toJSON
    SendStory
      { chat_id                = chat_id_
      , content                = content_
      , areas                  = areas_
      , caption                = caption_
      , privacy_settings       = privacy_settings_
      , active_period          = active_period_
      , from_story_full_id     = from_story_full_id_
      , is_posted_to_chat_page = is_posted_to_chat_page_
      , protect_content        = protect_content_
      }
        = A.object
          [ "@type"                  A..= AT.String "sendStory"
          , "chat_id"                A..= chat_id_
          , "content"                A..= content_
          , "areas"                  A..= areas_
          , "caption"                A..= caption_
          , "privacy_settings"       A..= privacy_settings_
          , "active_period"          A..= active_period_
          , "from_story_full_id"     A..= from_story_full_id_
          , "is_posted_to_chat_page" A..= is_posted_to_chat_page_
          , "protect_content"        A..= protect_content_
          ]

defaultSendStory :: SendStory
defaultSendStory =
  SendStory
    { chat_id                = Nothing
    , content                = Nothing
    , areas                  = Nothing
    , caption                = Nothing
    , privacy_settings       = Nothing
    , active_period          = Nothing
    , from_story_full_id     = Nothing
    , is_posted_to_chat_page = Nothing
    , protect_content        = Nothing
    }

