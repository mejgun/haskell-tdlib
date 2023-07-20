{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified Utils as U

-- |
-- Changes content and caption of a previously sent story
data EditStory = EditStory
  { -- | New story caption; pass null to keep the current caption
    caption :: Maybe FormattedText.FormattedText,
    -- | New content of the story; pass null to keep the current content
    content :: Maybe InputStoryContent.InputStoryContent,
    -- | Identifier of the story to edit
    story_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditStory where
  show
    EditStory
      { caption = caption_,
        content = content_,
        story_id = story_id_
      } =
      "EditStory"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "content" content_,
            U.p "story_id" story_id_
          ]

instance T.ToJSON EditStory where
  toJSON
    EditStory
      { caption = caption_,
        content = content_,
        story_id = story_id_
      } =
      A.object
        [ "@type" A..= T.String "editStory",
          "caption" A..= caption_,
          "content" A..= content_,
          "story_id" A..= story_id_
        ]
