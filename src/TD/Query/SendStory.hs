{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.InputStoryAreas as InputStoryAreas
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings
import qualified Utils as U

-- |
-- Sends a new story to a chat; requires can_post_stories rights for channel chats. Returns a temporary story
data SendStory = SendStory
  { -- | Pass true if the content of the story must be protected from forwarding and screenshotting
    protect_content :: Maybe Bool,
    -- | Pass true to keep the story accessible after expiration
    is_pinned :: Maybe Bool,
    -- | Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise
    active_period :: Maybe Int,
    -- | The privacy settings for the story
    privacy_settings :: Maybe StoryPrivacySettings.StoryPrivacySettings,
    -- | Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters
    caption :: Maybe FormattedText.FormattedText,
    -- | Clickable rectangle areas to be shown on the story media; pass null if none
    areas :: Maybe InputStoryAreas.InputStoryAreas,
    -- | Content of the story
    content :: Maybe InputStoryContent.InputStoryContent,
    -- | Identifier of the chat that will post the story
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendStory where
  show
    SendStory
      { protect_content = protect_content_,
        is_pinned = is_pinned_,
        active_period = active_period_,
        privacy_settings = privacy_settings_,
        caption = caption_,
        areas = areas_,
        content = content_,
        chat_id = chat_id_
      } =
      "SendStory"
        ++ U.cc
          [ U.p "protect_content" protect_content_,
            U.p "is_pinned" is_pinned_,
            U.p "active_period" active_period_,
            U.p "privacy_settings" privacy_settings_,
            U.p "caption" caption_,
            U.p "areas" areas_,
            U.p "content" content_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SendStory where
  toJSON
    SendStory
      { protect_content = protect_content_,
        is_pinned = is_pinned_,
        active_period = active_period_,
        privacy_settings = privacy_settings_,
        caption = caption_,
        areas = areas_,
        content = content_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "sendStory",
          "protect_content" A..= protect_content_,
          "is_pinned" A..= is_pinned_,
          "active_period" A..= active_period_,
          "privacy_settings" A..= privacy_settings_,
          "caption" A..= caption_,
          "areas" A..= areas_,
          "content" A..= content_,
          "chat_id" A..= chat_id_
        ]
