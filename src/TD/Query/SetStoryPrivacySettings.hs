{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStoryPrivacySettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings
import qualified Utils as U

-- |
-- Changes privacy settings of a previously sent story @story_id Identifier of the story @privacy_settings The new privacy settigs for the story
data SetStoryPrivacySettings = SetStoryPrivacySettings
  { -- |
    privacy_settings :: Maybe StoryPrivacySettings.StoryPrivacySettings,
    -- |
    story_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetStoryPrivacySettings where
  show
    SetStoryPrivacySettings
      { privacy_settings = privacy_settings_,
        story_id = story_id_
      } =
      "SetStoryPrivacySettings"
        ++ U.cc
          [ U.p "privacy_settings" privacy_settings_,
            U.p "story_id" story_id_
          ]

instance T.ToJSON SetStoryPrivacySettings where
  toJSON
    SetStoryPrivacySettings
      { privacy_settings = privacy_settings_,
        story_id = story_id_
      } =
      A.object
        [ "@type" A..= T.String "setStoryPrivacySettings",
          "privacy_settings" A..= privacy_settings_,
          "story_id" A..= story_id_
        ]
