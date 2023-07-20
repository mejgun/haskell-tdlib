{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatActiveStoriesList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StoryList as StoryList
import qualified Utils as U

-- |
-- Changes story list in which stories from the chat are shown @chat_id Identifier of the chat that posted stories @story_list New list for active stories posted by the chat
data SetChatActiveStoriesList = SetChatActiveStoriesList
  { -- |
    story_list :: Maybe StoryList.StoryList,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatActiveStoriesList where
  show
    SetChatActiveStoriesList
      { story_list = story_list_,
        chat_id = chat_id_
      } =
      "SetChatActiveStoriesList"
        ++ U.cc
          [ U.p "story_list" story_list_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatActiveStoriesList where
  toJSON
    SetChatActiveStoriesList
      { story_list = story_list_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatActiveStoriesList",
          "story_list" A..= story_list_,
          "chat_id" A..= chat_id_
        ]
