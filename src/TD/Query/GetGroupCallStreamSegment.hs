module TD.Query.GetGroupCallStreamSegment
  (GetGroupCallStreamSegment(..)
  , defaultGetGroupCallStreamSegment
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GroupCallVideoQuality as GroupCallVideoQuality

-- | Returns a file with a segment of a group call stream in a modified OGG format for audio or MPEG-4 format for video. Returns 'TD.Data.FilePart.FilePart'
data GetGroupCallStreamSegment
  = GetGroupCallStreamSegment
    { group_call_id :: Maybe Int                                         -- ^ Group call identifier
    , time_offset   :: Maybe Int                                         -- ^ Point in time when the stream segment begins; Unix timestamp in milliseconds
    , scale         :: Maybe Int                                         -- ^ Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
    , channel_id    :: Maybe Int                                         -- ^ Identifier of an audio/video channel to get as received from tgcalls
    , video_quality :: Maybe GroupCallVideoQuality.GroupCallVideoQuality -- ^ Video quality as received from tgcalls; pass null to get the worst available quality
    }
  deriving (Eq, Show)

instance I.ShortShow GetGroupCallStreamSegment where
  shortShow
    GetGroupCallStreamSegment
      { group_call_id = group_call_id_
      , time_offset   = time_offset_
      , scale         = scale_
      , channel_id    = channel_id_
      , video_quality = video_quality_
      }
        = "GetGroupCallStreamSegment"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "time_offset"   `I.p` time_offset_
          , "scale"         `I.p` scale_
          , "channel_id"    `I.p` channel_id_
          , "video_quality" `I.p` video_quality_
          ]

instance AT.ToJSON GetGroupCallStreamSegment where
  toJSON
    GetGroupCallStreamSegment
      { group_call_id = group_call_id_
      , time_offset   = time_offset_
      , scale         = scale_
      , channel_id    = channel_id_
      , video_quality = video_quality_
      }
        = A.object
          [ "@type"         A..= AT.String "getGroupCallStreamSegment"
          , "group_call_id" A..= group_call_id_
          , "time_offset"   A..= time_offset_
          , "scale"         A..= scale_
          , "channel_id"    A..= channel_id_
          , "video_quality" A..= video_quality_
          ]

defaultGetGroupCallStreamSegment :: GetGroupCallStreamSegment
defaultGetGroupCallStreamSegment =
  GetGroupCallStreamSegment
    { group_call_id = Nothing
    , time_offset   = Nothing
    , scale         = Nothing
    , channel_id    = Nothing
    , video_quality = Nothing
    }

