{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStoryPrivacySettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings
import qualified Utils as U

-- |
-- Changes privacy settings of a story. Can be called only if story.can_be_edited == true
data SetStoryPrivacySettings = SetStoryPrivacySettings
  { -- | The new privacy settigs for the story
    privacy_settings :: Maybe StoryPrivacySettings.StoryPrivacySettings,
    -- | Identifier of the story
    story_id :: Maybe Int,
    -- | Identifier of the chat that posted the story
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetStoryPrivacySettings where
  show
    SetStoryPrivacySettings
      { privacy_settings = privacy_settings_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "SetStoryPrivacySettings"
        ++ U.cc
          [ U.p "privacy_settings" privacy_settings_,
            U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON SetStoryPrivacySettings where
  toJSON
    SetStoryPrivacySettings
      { privacy_settings = privacy_settings_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setStoryPrivacySettings",
          "privacy_settings" A..= privacy_settings_,
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
