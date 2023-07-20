{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a story
data GetStory = GetStory
  { -- | Pass true to get only locally available information without sending network requests
    only_local :: Maybe Bool,
    -- | Story identifier
    story_id :: Maybe Int,
    -- | Identifier of the chat that posted the story
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetStory where
  show
    GetStory
      { only_local = only_local_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "GetStory"
        ++ U.cc
          [ U.p "only_local" only_local_,
            U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON GetStory where
  toJSON
    GetStory
      { only_local = only_local_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getStory",
          "only_local" A..= only_local_,
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
