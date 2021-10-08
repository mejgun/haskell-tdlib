-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VoiceNote where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel 
-- 
-- __duration__ Duration of the voice note, in seconds; as defined by the sender
-- 
-- __waveform__ A waveform representation of the voice note in 5-bit format
-- 
-- __mime_type__ MIME type of the file; as defined by the sender
-- 
-- __voice__ File containing the voice note
data VoiceNote = 

 VoiceNote { voice :: Maybe File.File, mime_type :: Maybe String, waveform :: Maybe String, duration :: Maybe Int }  deriving (Eq)

instance Show VoiceNote where
 show VoiceNote { voice=voice, mime_type=mime_type, waveform=waveform, duration=duration } =
  "VoiceNote" ++ cc [p "voice" voice, p "mime_type" mime_type, p "waveform" waveform, p "duration" duration ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON VoiceNote where
 toJSON VoiceNote { voice = voice, mime_type = mime_type, waveform = waveform, duration = duration } =
  A.object [ "@type" A..= T.String "voiceNote", "voice" A..= voice, "mime_type" A..= mime_type, "waveform" A..= waveform, "duration" A..= duration ]

instance T.FromJSON VoiceNote where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "voiceNote" -> parseVoiceNote v
   _ -> mempty
  where
   parseVoiceNote :: A.Value -> T.Parser VoiceNote
   parseVoiceNote = A.withObject "VoiceNote" $ \o -> do
    voice <- o A..:? "voice"
    mime_type <- o A..:? "mime_type"
    waveform <- o A..:? "waveform"
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ VoiceNote { voice = voice, mime_type = mime_type, waveform = waveform, duration = duration }
 parseJSON _ = mempty
