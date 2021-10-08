-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.JoinGroupCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Joins an active group call. Returns join response payload for tgcalls
-- 
-- __group_call_id__ Group call identifier
-- 
-- __participant_id__ Identifier of a group call participant, which will be used to join the call; pass null to join as self; voice chats only
-- 
-- __audio_source_id__ Caller audio channel synchronization source identifier; received from tgcalls
-- 
-- __payload__ Group call join payload; received from tgcalls
-- 
-- __is_muted__ True, if the user's microphone is muted
-- 
-- __is_my_video_enabled__ True, if the user's video is enabled
-- 
-- __invite_hash__ If non-empty, invite hash to be used to join the group call without being muted by administrators
data JoinGroupCall = 

 JoinGroupCall { invite_hash :: Maybe String, is_my_video_enabled :: Maybe Bool, is_muted :: Maybe Bool, payload :: Maybe String, audio_source_id :: Maybe Int, participant_id :: Maybe MessageSender.MessageSender, group_call_id :: Maybe Int }  deriving (Eq)

instance Show JoinGroupCall where
 show JoinGroupCall { invite_hash=invite_hash, is_my_video_enabled=is_my_video_enabled, is_muted=is_muted, payload=payload, audio_source_id=audio_source_id, participant_id=participant_id, group_call_id=group_call_id } =
  "JoinGroupCall" ++ cc [p "invite_hash" invite_hash, p "is_my_video_enabled" is_my_video_enabled, p "is_muted" is_muted, p "payload" payload, p "audio_source_id" audio_source_id, p "participant_id" participant_id, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON JoinGroupCall where
 toJSON JoinGroupCall { invite_hash = invite_hash, is_my_video_enabled = is_my_video_enabled, is_muted = is_muted, payload = payload, audio_source_id = audio_source_id, participant_id = participant_id, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "joinGroupCall", "invite_hash" A..= invite_hash, "is_my_video_enabled" A..= is_my_video_enabled, "is_muted" A..= is_muted, "payload" A..= payload, "audio_source_id" A..= audio_source_id, "participant_id" A..= participant_id, "group_call_id" A..= group_call_id ]

instance T.FromJSON JoinGroupCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "joinGroupCall" -> parseJoinGroupCall v
   _ -> mempty
  where
   parseJoinGroupCall :: A.Value -> T.Parser JoinGroupCall
   parseJoinGroupCall = A.withObject "JoinGroupCall" $ \o -> do
    invite_hash <- o A..:? "invite_hash"
    is_my_video_enabled <- o A..:? "is_my_video_enabled"
    is_muted <- o A..:? "is_muted"
    payload <- o A..:? "payload"
    audio_source_id <- mconcat [ o A..:? "audio_source_id", readMaybe <$> (o A..: "audio_source_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    participant_id <- o A..:? "participant_id"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ JoinGroupCall { invite_hash = invite_hash, is_my_video_enabled = is_my_video_enabled, is_muted = is_muted, payload = payload, audio_source_id = audio_source_id, participant_id = participant_id, group_call_id = group_call_id }
 parseJSON _ = mempty
