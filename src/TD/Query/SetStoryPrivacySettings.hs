module TD.Query.SetStoryPrivacySettings
  (SetStoryPrivacySettings(..)
  , defaultSetStoryPrivacySettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings

-- | Changes privacy settings of a story. Can be called only if story.can_be_edited == true
data SetStoryPrivacySettings
  = SetStoryPrivacySettings
    { story_sender_chat_id :: Maybe Int                                       -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int                                       -- ^ Identifier of the story
    , privacy_settings     :: Maybe StoryPrivacySettings.StoryPrivacySettings -- ^ The new privacy settigs for the story
    }
  deriving (Eq, Show)

instance I.ShortShow SetStoryPrivacySettings where
  shortShow
    SetStoryPrivacySettings
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , privacy_settings     = privacy_settings_
      }
        = "SetStoryPrivacySettings"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "privacy_settings"     `I.p` privacy_settings_
          ]

instance AT.ToJSON SetStoryPrivacySettings where
  toJSON
    SetStoryPrivacySettings
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , privacy_settings     = privacy_settings_
      }
        = A.object
          [ "@type"                A..= AT.String "setStoryPrivacySettings"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "privacy_settings"     A..= privacy_settings_
          ]

defaultSetStoryPrivacySettings :: SetStoryPrivacySettings
defaultSetStoryPrivacySettings =
  SetStoryPrivacySettings
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , privacy_settings     = Nothing
    }

