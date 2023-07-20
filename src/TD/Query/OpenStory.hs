{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.OpenStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that a story is opened and is being viewed by the user
data OpenStory = OpenStory
  { -- | The identifier of the story
    story_id :: Maybe Int,
    -- | The identifier of the sender of the opened story
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show OpenStory where
  show
    OpenStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "OpenStory"
        ++ U.cc
          [ U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON OpenStory where
  toJSON
    OpenStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "openStory",
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
