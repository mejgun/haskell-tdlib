-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VoiceChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Describes a voice chat
-- 
-- __group_call_id__ Group call identifier of an active voice chat; 0 if none. Full informationa about the voice chat can be received through the method getGroupCall
-- 
-- __has_participants__ True, if the voice chat has participants
-- 
-- __default_participant_id__ Default group call participant identifier to join the voice chat; may be null
data VoiceChat = 

 VoiceChat { default_participant_id :: Maybe MessageSender.MessageSender, has_participants :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Eq)

instance Show VoiceChat where
 show VoiceChat { default_participant_id=default_participant_id, has_participants=has_participants, group_call_id=group_call_id } =
  "VoiceChat" ++ cc [p "default_participant_id" default_participant_id, p "has_participants" has_participants, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON VoiceChat where
 toJSON VoiceChat { default_participant_id = default_participant_id, has_participants = has_participants, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "voiceChat", "default_participant_id" A..= default_participant_id, "has_participants" A..= has_participants, "group_call_id" A..= group_call_id ]

instance T.FromJSON VoiceChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "voiceChat" -> parseVoiceChat v
   _ -> mempty
  where
   parseVoiceChat :: A.Value -> T.Parser VoiceChat
   parseVoiceChat = A.withObject "VoiceChat" $ \o -> do
    default_participant_id <- o A..:? "default_participant_id"
    has_participants <- o A..:? "has_participants"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ VoiceChat { default_participant_id = default_participant_id, has_participants = has_participants, group_call_id = group_call_id }
 parseJSON _ = mempty
