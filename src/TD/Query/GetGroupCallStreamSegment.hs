{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetGroupCallStreamSegment where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.GroupCallVideoQuality as GroupCallVideoQuality
import qualified Utils as U

-- |
-- Returns a file with a segment of a group call stream in a modified OGG format for audio or MPEG-4 format for video
data GetGroupCallStreamSegment = GetGroupCallStreamSegment
  { -- | Video quality as received from tgcalls; pass null to get the worst available quality
    video_quality :: Maybe GroupCallVideoQuality.GroupCallVideoQuality,
    -- | Identifier of an audio/video channel to get as received from tgcalls
    channel_id :: Maybe Int,
    -- | Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
    scale :: Maybe Int,
    -- | Point in time when the stream segment begins; Unix timestamp in milliseconds
    time_offset :: Maybe Int,
    -- | Group call identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetGroupCallStreamSegment where
  show
    GetGroupCallStreamSegment
      { video_quality = video_quality_,
        channel_id = channel_id_,
        scale = scale_,
        time_offset = time_offset_,
        group_call_id = group_call_id_
      } =
      "GetGroupCallStreamSegment"
        ++ U.cc
          [ U.p "video_quality" video_quality_,
            U.p "channel_id" channel_id_,
            U.p "scale" scale_,
            U.p "time_offset" time_offset_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON GetGroupCallStreamSegment where
  toJSON
    GetGroupCallStreamSegment
      { video_quality = video_quality_,
        channel_id = channel_id_,
        scale = scale_,
        time_offset = time_offset_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "getGroupCallStreamSegment",
          "video_quality" A..= video_quality_,
          "channel_id" A..= channel_id_,
          "scale" A..= scale_,
          "time_offset" A..= time_offset_,
          "group_call_id" A..= group_call_id_
        ]
