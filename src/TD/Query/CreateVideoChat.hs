{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateVideoChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Creates a video chat (a group call bound to a chat). Available only for basic groups, supergroups and channels; requires can_manage_video_chats rights
data CreateVideoChat = CreateVideoChat
  { -- | Pass true to create an RTMP stream instead of an ordinary video chat; requires creator privileges
    is_rtmp_stream :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 to start the video chat immediately. The date must be at least 10 seconds and at most 8 days in the future
    start_date :: Maybe Int,
    -- | Group call title; if empty, chat title will be used
    title :: Maybe String,
    -- | Identifier of a chat in which the video chat will be created
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateVideoChat where
  show
    CreateVideoChat
      { is_rtmp_stream = is_rtmp_stream_,
        start_date = start_date_,
        title = title_,
        chat_id = chat_id_
      } =
      "CreateVideoChat"
        ++ U.cc
          [ U.p "is_rtmp_stream" is_rtmp_stream_,
            U.p "start_date" start_date_,
            U.p "title" title_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON CreateVideoChat where
  toJSON
    CreateVideoChat
      { is_rtmp_stream = is_rtmp_stream_,
        start_date = start_date_,
        title = title_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "createVideoChat",
          "is_rtmp_stream" A..= is_rtmp_stream_,
          "start_date" A..= start_date_,
          "title" A..= title_,
          "chat_id" A..= chat_id_
        ]
