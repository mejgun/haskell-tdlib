-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetGroupCallParticipantIsSpeaking where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Informs TDLib that speaking state of a participant of an active group has changed 
-- 
-- __group_call_id__ Group call identifier
-- 
-- __audio_source__ Group call participant's synchronization audio source identifier, or 0 for the current user
-- 
-- __is_speaking__ True, if the user is speaking
data SetGroupCallParticipantIsSpeaking = 

 SetGroupCallParticipantIsSpeaking { is_speaking :: Maybe Bool, audio_source :: Maybe Int, group_call_id :: Maybe Int }  deriving (Eq)

instance Show SetGroupCallParticipantIsSpeaking where
 show SetGroupCallParticipantIsSpeaking { is_speaking=is_speaking, audio_source=audio_source, group_call_id=group_call_id } =
  "SetGroupCallParticipantIsSpeaking" ++ cc [p "is_speaking" is_speaking, p "audio_source" audio_source, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetGroupCallParticipantIsSpeaking where
 toJSON SetGroupCallParticipantIsSpeaking { is_speaking = is_speaking, audio_source = audio_source, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "setGroupCallParticipantIsSpeaking", "is_speaking" A..= is_speaking, "audio_source" A..= audio_source, "group_call_id" A..= group_call_id ]

instance T.FromJSON SetGroupCallParticipantIsSpeaking where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setGroupCallParticipantIsSpeaking" -> parseSetGroupCallParticipantIsSpeaking v
   _ -> mempty
  where
   parseSetGroupCallParticipantIsSpeaking :: A.Value -> T.Parser SetGroupCallParticipantIsSpeaking
   parseSetGroupCallParticipantIsSpeaking = A.withObject "SetGroupCallParticipantIsSpeaking" $ \o -> do
    is_speaking <- o A..:? "is_speaking"
    audio_source <- mconcat [ o A..:? "audio_source", readMaybe <$> (o A..: "audio_source" :: T.Parser String)] :: T.Parser (Maybe Int)
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetGroupCallParticipantIsSpeaking { is_speaking = is_speaking, audio_source = audio_source, group_call_id = group_call_id }
 parseJSON _ = mempty
