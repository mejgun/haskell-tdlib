-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.StartGroupCallRecording where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Starts recording of an active group call. Requires groupCall.can_be_managed group call flag 
-- 
-- __group_call_id__ Group call identifier
-- 
-- __title__ Group call recording title; 0-64 characters
-- 
-- __record_video__ Pass true to record a video file instead of an audio file
-- 
-- __use_portrait_orientation__ Pass true to use portrait orientation for video instead of landscape one
data StartGroupCallRecording = 

 StartGroupCallRecording { use_portrait_orientation :: Maybe Bool, record_video :: Maybe Bool, title :: Maybe String, group_call_id :: Maybe Int }  deriving (Eq)

instance Show StartGroupCallRecording where
 show StartGroupCallRecording { use_portrait_orientation=use_portrait_orientation, record_video=record_video, title=title, group_call_id=group_call_id } =
  "StartGroupCallRecording" ++ U.cc [U.p "use_portrait_orientation" use_portrait_orientation, U.p "record_video" record_video, U.p "title" title, U.p "group_call_id" group_call_id ]

instance T.ToJSON StartGroupCallRecording where
 toJSON StartGroupCallRecording { use_portrait_orientation = use_portrait_orientation, record_video = record_video, title = title, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "startGroupCallRecording", "use_portrait_orientation" A..= use_portrait_orientation, "record_video" A..= record_video, "title" A..= title, "group_call_id" A..= group_call_id ]

instance T.FromJSON StartGroupCallRecording where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "startGroupCallRecording" -> parseStartGroupCallRecording v
   _ -> mempty
  where
   parseStartGroupCallRecording :: A.Value -> T.Parser StartGroupCallRecording
   parseStartGroupCallRecording = A.withObject "StartGroupCallRecording" $ \o -> do
    use_portrait_orientation <- o A..:? "use_portrait_orientation"
    record_video <- o A..:? "record_video"
    title <- o A..:? "title"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StartGroupCallRecording { use_portrait_orientation = use_portrait_orientation, record_video = record_video, title = title, group_call_id = group_call_id }
 parseJSON _ = mempty
