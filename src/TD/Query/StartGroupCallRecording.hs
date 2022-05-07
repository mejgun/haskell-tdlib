{-# LANGUAGE OverloadedStrings #-}

module TD.Query.StartGroupCallRecording where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Starts recording of an active group call. Requires groupCall.can_be_managed group call flag @group_call_id Group call identifier @title Group call recording title; 0-64 characters
data StartGroupCallRecording = StartGroupCallRecording
  { -- |
    use_portrait_orientation :: Maybe Bool,
    -- | Pass true to record a video file instead of an audio file @use_portrait_orientation Pass true to use portrait orientation for video instead of landscape one
    record_video :: Maybe Bool,
    -- |
    title :: Maybe String,
    -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show StartGroupCallRecording where
  show
    StartGroupCallRecording
      { use_portrait_orientation = use_portrait_orientation,
        record_video = record_video,
        title = title,
        group_call_id = group_call_id
      } =
      "StartGroupCallRecording"
        ++ U.cc
          [ U.p "use_portrait_orientation" use_portrait_orientation,
            U.p "record_video" record_video,
            U.p "title" title,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON StartGroupCallRecording where
  toJSON
    StartGroupCallRecording
      { use_portrait_orientation = use_portrait_orientation,
        record_video = record_video,
        title = title,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "startGroupCallRecording",
          "use_portrait_orientation" A..= use_portrait_orientation,
          "record_video" A..= record_video,
          "title" A..= title,
          "group_call_id" A..= group_call_id
        ]
