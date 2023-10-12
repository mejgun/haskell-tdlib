module TD.Query.EditStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputStoryContent as InputStoryContent
import qualified TD.Data.FormattedText as FormattedText

data EditStory -- ^ Changes content and caption of a previously sent story
  = EditStory
    { story_id :: Maybe Int                                 -- ^ Identifier of the story to edit
    , content  :: Maybe InputStoryContent.InputStoryContent -- ^ New content of the story; pass null to keep the current content
    , caption  :: Maybe FormattedText.FormattedText         -- ^ New story caption; pass null to keep the current caption
    }
  deriving (Eq)

instance Show EditStory where
  show
    EditStory
      { story_id = story_id_
      , content  = content_
      , caption  = caption_
      }
        = "EditStory"
          ++ I.cc
          [ "story_id" `I.p` story_id_
          , "content"  `I.p` content_
          , "caption"  `I.p` caption_
          ]

instance AT.ToJSON EditStory where
  toJSON
    EditStory
      { story_id = story_id_
      , content  = content_
      , caption  = caption_
      }
        = A.object
          [ "@type"    A..= AT.String "editStory"
          , "story_id" A..= story_id_
          , "content"  A..= content_
          , "caption"  A..= caption_
          ]
