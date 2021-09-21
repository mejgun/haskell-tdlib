-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupCallStreamSegment where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.GroupCallVideoQuality as GroupCallVideoQuality

-- |
-- 
-- Returns a file with a segment of a group call stream in a modified OGG format for audio or MPEG-4 format for video
-- 
-- __group_call_id__ Group call identifier
-- 
-- __time_offset__ Point in time when the stream segment begins; Unix timestamp in milliseconds
-- 
-- __scale__ Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
-- 
-- __channel_id__ Identifier of an audio/video channel to get as received from tgcalls
-- 
-- __video_quality__ Video quality as received from tgcalls
data GetGroupCallStreamSegment = 

 GetGroupCallStreamSegment { video_quality :: Maybe GroupCallVideoQuality.GroupCallVideoQuality, channel_id :: Maybe Int, scale :: Maybe Int, time_offset :: Maybe Int, group_call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetGroupCallStreamSegment where
 toJSON (GetGroupCallStreamSegment { video_quality = video_quality, channel_id = channel_id, scale = scale, time_offset = time_offset, group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "getGroupCallStreamSegment", "video_quality" A..= video_quality, "channel_id" A..= channel_id, "scale" A..= scale, "time_offset" A..= time_offset, "group_call_id" A..= group_call_id ]

instance T.FromJSON GetGroupCallStreamSegment where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGroupCallStreamSegment" -> parseGetGroupCallStreamSegment v
   _ -> mempty
  where
   parseGetGroupCallStreamSegment :: A.Value -> T.Parser GetGroupCallStreamSegment
   parseGetGroupCallStreamSegment = A.withObject "GetGroupCallStreamSegment" $ \o -> do
    video_quality <- o A..:? "video_quality"
    channel_id <- mconcat [ o A..:? "channel_id", readMaybe <$> (o A..: "channel_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    scale <- mconcat [ o A..:? "scale", readMaybe <$> (o A..: "scale" :: T.Parser String)] :: T.Parser (Maybe Int)
    time_offset <- mconcat [ o A..:? "time_offset", readMaybe <$> (o A..: "time_offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetGroupCallStreamSegment { video_quality = video_quality, channel_id = channel_id, scale = scale, time_offset = time_offset, group_call_id = group_call_id }