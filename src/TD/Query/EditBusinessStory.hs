module TD.Query.EditBusinessStory
  (EditBusinessStory(..)
  , defaultEditBusinessStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified TD.Data.InputStoryAreas as InputStoryAreas
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings

-- | Changes a story sent by the bot on behalf of a business account; for bots only. Returns 'TD.Data.Story.Story'
data EditBusinessStory
  = EditBusinessStory
    { story_sender_chat_id :: Maybe Int                                       -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int                                       -- ^ Identifier of the story to edit
    , content              :: Maybe InputStoryContent.InputStoryContent       -- ^ New content of the story
    , areas                :: Maybe InputStoryAreas.InputStoryAreas           -- ^ New clickable rectangle areas to be shown on the story media
    , caption              :: Maybe FormattedText.FormattedText               -- ^ New story caption
    , privacy_settings     :: Maybe StoryPrivacySettings.StoryPrivacySettings -- ^ The new privacy settings for the story
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessStory where
  shortShow
    EditBusinessStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , content              = content_
      , areas                = areas_
      , caption              = caption_
      , privacy_settings     = privacy_settings_
      }
        = "EditBusinessStory"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "content"              `I.p` content_
          , "areas"                `I.p` areas_
          , "caption"              `I.p` caption_
          , "privacy_settings"     `I.p` privacy_settings_
          ]

instance AT.ToJSON EditBusinessStory where
  toJSON
    EditBusinessStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , content              = content_
      , areas                = areas_
      , caption              = caption_
      , privacy_settings     = privacy_settings_
      }
        = A.object
          [ "@type"                A..= AT.String "editBusinessStory"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "content"              A..= content_
          , "areas"                A..= areas_
          , "caption"              A..= caption_
          , "privacy_settings"     A..= privacy_settings_
          ]

defaultEditBusinessStory :: EditBusinessStory
defaultEditBusinessStory =
  EditBusinessStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , content              = Nothing
    , areas                = Nothing
    , caption              = Nothing
    , privacy_settings     = Nothing
    }

