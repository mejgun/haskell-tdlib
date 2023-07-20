{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReportStory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReportReason as ReportReason
import qualified Utils as U

-- |
-- Reports a story to the Telegram moderators
data ReportStory = ReportStory
  { -- | Additional report details; 0-1024 characters
    text :: Maybe String,
    -- | The reason for reporting the story
    reason :: Maybe ReportReason.ReportReason,
    -- | The identifier of the story to report
    story_id :: Maybe Int,
    -- | The identifier of the sender of the story to report
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReportStory where
  show
    ReportStory
      { text = text_,
        reason = reason_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "ReportStory"
        ++ U.cc
          [ U.p "text" text_,
            U.p "reason" reason_,
            U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON ReportStory where
  toJSON
    ReportStory
      { text = text_,
        reason = reason_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "reportStory",
          "text" A..= text_,
          "reason" A..= reason_,
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
