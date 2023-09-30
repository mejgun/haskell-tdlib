{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.InputStoryAreas as InputStoryAreas
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified Utils as U

-- |
-- Changes content and caption of a story. Can be called only if story.can_be_edited == true
data EditStory = EditStory
  { -- | New story caption; pass null to keep the current caption
    caption :: Maybe FormattedText.FormattedText,
    -- | New clickable rectangle areas to be shown on the story media; pass null to keep the current areas. Areas can't be edited if story content isn't changed
    areas :: Maybe InputStoryAreas.InputStoryAreas,
    -- | New content of the story; pass null to keep the current content
    content :: Maybe InputStoryContent.InputStoryContent,
    -- | Identifier of the story to edit
    story_id :: Maybe Int,
    -- | Identifier of the chat that posted the story
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditStory where
  show
    EditStory
      { caption = caption_,
        areas = areas_,
        content = content_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "EditStory"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "areas" areas_,
            U.p "content" content_,
            U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON EditStory where
  toJSON
    EditStory
      { caption = caption_,
        areas = areas_,
        content = content_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "editStory",
          "caption" A..= caption_,
          "areas" A..= areas_,
          "content" A..= content_,
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
