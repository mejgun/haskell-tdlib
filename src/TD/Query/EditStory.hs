module TD.Query.EditStory
  (EditStory(..)
  , defaultEditStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified TD.Data.InputStoryAreas as InputStoryAreas
import qualified TD.Data.FormattedText as FormattedText

-- | Changes content and caption of a story. Can be called only if story.can_be_edited == true. Returns 'TD.Data.Ok.Ok'
data EditStory
  = EditStory
    { story_sender_chat_id :: Maybe Int                                 -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int                                 -- ^ Identifier of the story to edit
    , content              :: Maybe InputStoryContent.InputStoryContent -- ^ New content of the story; pass null to keep the current content
    , areas                :: Maybe InputStoryAreas.InputStoryAreas     -- ^ New clickable rectangle areas to be shown on the story media; pass null to keep the current areas. Areas can't be edited if story content isn't changed
    , caption              :: Maybe FormattedText.FormattedText         -- ^ New story caption; pass null to keep the current caption
    }
  deriving (Eq, Show)

instance I.ShortShow EditStory where
  shortShow
    EditStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , content              = content_
      , areas                = areas_
      , caption              = caption_
      }
        = "EditStory"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "content"              `I.p` content_
          , "areas"                `I.p` areas_
          , "caption"              `I.p` caption_
          ]

instance AT.ToJSON EditStory where
  toJSON
    EditStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , content              = content_
      , areas                = areas_
      , caption              = caption_
      }
        = A.object
          [ "@type"                A..= AT.String "editStory"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "content"              A..= content_
          , "areas"                A..= areas_
          , "caption"              A..= caption_
          ]

defaultEditStory :: EditStory
defaultEditStory =
  EditStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , content              = Nothing
    , areas                = Nothing
    , caption              = Nothing
    }

