{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CloseStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that a story is closed by the user
data CloseStory = CloseStory
  { -- | The identifier of the story
    story_id :: Maybe Int,
    -- | The identifier of the sender of the story to close
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CloseStory where
  show
    CloseStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "CloseStory"
        ++ U.cc
          [ U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON CloseStory where
  toJSON
    CloseStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "closeStory",
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
