-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VideoChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Describes a video chat
-- 
-- __group_call_id__ Group call identifier of an active video chat; 0 if none. Full information about the video chat can be received through the method getGroupCall
-- 
-- __has_participants__ True, if the video chat has participants
-- 
-- __default_participant_id__ Default group call participant identifier to join the video chat; may be null
data VideoChat = 

 VideoChat { default_participant_id :: Maybe MessageSender.MessageSender, has_participants :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Eq)

instance Show VideoChat where
 show VideoChat { default_participant_id=default_participant_id, has_participants=has_participants, group_call_id=group_call_id } =
  "VideoChat" ++ U.cc [U.p "default_participant_id" default_participant_id, U.p "has_participants" has_participants, U.p "group_call_id" group_call_id ]

instance T.ToJSON VideoChat where
 toJSON VideoChat { default_participant_id = default_participant_id, has_participants = has_participants, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "videoChat", "default_participant_id" A..= default_participant_id, "has_participants" A..= has_participants, "group_call_id" A..= group_call_id ]

instance T.FromJSON VideoChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "videoChat" -> parseVideoChat v
   _ -> mempty
  where
   parseVideoChat :: A.Value -> T.Parser VideoChat
   parseVideoChat = A.withObject "VideoChat" $ \o -> do
    default_participant_id <- o A..:? "default_participant_id"
    has_participants <- o A..:? "has_participants"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ VideoChat { default_participant_id = default_participant_id, has_participants = has_participants, group_call_id = group_call_id }
 parseJSON _ = mempty
