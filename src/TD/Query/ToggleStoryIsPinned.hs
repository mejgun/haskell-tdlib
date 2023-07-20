{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleStoryIsPinned where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether a story is accessible after expiration @story_id Identifier of the story @is_pinned Pass true to make the story accessible after expiration; pass false to make it private
data ToggleStoryIsPinned = ToggleStoryIsPinned
  { -- |
    is_pinned :: Maybe Bool,
    -- |
    story_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleStoryIsPinned where
  show
    ToggleStoryIsPinned
      { is_pinned = is_pinned_,
        story_id = story_id_
      } =
      "ToggleStoryIsPinned"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "story_id" story_id_
          ]

instance T.ToJSON ToggleStoryIsPinned where
  toJSON
    ToggleStoryIsPinned
      { is_pinned = is_pinned_,
        story_id = story_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleStoryIsPinned",
          "is_pinned" A..= is_pinned_,
          "story_id" A..= story_id_
        ]
