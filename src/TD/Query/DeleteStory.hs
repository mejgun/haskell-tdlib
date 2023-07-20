{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes a previously sent story @story_id Identifier of the story to delete
data DeleteStory = DeleteStory
  { -- |
    story_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteStory where
  show
    DeleteStory
      { story_id = story_id_
      } =
      "DeleteStory"
        ++ U.cc
          [ U.p "story_id" story_id_
          ]

instance T.ToJSON DeleteStory where
  toJSON
    DeleteStory
      { story_id = story_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteStory",
          "story_id" A..= story_id_
        ]
