{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleStoryIsPinned where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether a story is accessible after expiration. Can be called only if story.can_toggle_is_pinned == true
data ToggleStoryIsPinned = ToggleStoryIsPinned
  { -- | Pass true to make the story accessible after expiration; pass false to make it private
    is_pinned :: Maybe Bool,
    -- | Identifier of the story
    story_id :: Maybe Int,
    -- | Identifier of the chat that posted the story
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleStoryIsPinned where
  show
    ToggleStoryIsPinned
      { is_pinned = is_pinned_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "ToggleStoryIsPinned"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON ToggleStoryIsPinned where
  toJSON
    ToggleStoryIsPinned
      { is_pinned = is_pinned_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleStoryIsPinned",
          "is_pinned" A..= is_pinned_,
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
