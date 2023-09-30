{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes a previously sent story. Can be called only if story.can_be_deleted == true
data DeleteStory = DeleteStory
  { -- | Identifier of the story to delete
    story_id :: Maybe Int,
    -- | Identifier of the chat that posted the story
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteStory where
  show
    DeleteStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "DeleteStory"
        ++ U.cc
          [ U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON DeleteStory where
  toJSON
    DeleteStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteStory",
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
