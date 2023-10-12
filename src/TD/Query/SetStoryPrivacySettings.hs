module TD.Query.SetStoryPrivacySettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings

data SetStoryPrivacySettings -- ^ Changes privacy settings of a previously sent story
  = SetStoryPrivacySettings
    { story_id         :: Maybe Int                                       -- ^ Identifier of the story
    , privacy_settings :: Maybe StoryPrivacySettings.StoryPrivacySettings -- ^ The new privacy settigs for the story
    }
  deriving (Eq)

instance Show SetStoryPrivacySettings where
  show
    SetStoryPrivacySettings
      { story_id         = story_id_
      , privacy_settings = privacy_settings_
      }
        = "SetStoryPrivacySettings"
          ++ I.cc
          [ "story_id"         `I.p` story_id_
          , "privacy_settings" `I.p` privacy_settings_
          ]

instance AT.ToJSON SetStoryPrivacySettings where
  toJSON
    SetStoryPrivacySettings
      { story_id         = story_id_
      , privacy_settings = privacy_settings_
      }
        = A.object
          [ "@type"            A..= AT.String "setStoryPrivacySettings"
          , "story_id"         A..= story_id_
          , "privacy_settings" A..= privacy_settings_
          ]
