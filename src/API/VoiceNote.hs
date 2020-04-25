-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VoiceNote where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

data VoiceNote = 
 VoiceNote { voice :: Maybe File.File, mime_type :: Maybe String, waveform :: Maybe String, duration :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON VoiceNote where
 toJSON (VoiceNote { voice = voice, mime_type = mime_type, waveform = waveform, duration = duration }) =
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