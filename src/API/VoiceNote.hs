-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VoiceNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

--main = putStrLn "ok"

data VoiceNote = 
 VoiceNote { voice :: File.File, mime_type :: String, waveform :: String, duration :: Int }  deriving (Show)

instance T.ToJSON VoiceNote where
 toJSON (VoiceNote { voice = voice, mime_type = mime_type, waveform = waveform, duration = duration }) =
  A.object [ "@type" A..= T.String "voiceNote", "voice" A..= voice, "mime_type" A..= mime_type, "waveform" A..= waveform, "duration" A..= duration ]



instance T.FromJSON VoiceNote where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "voiceNote" -> parseVoiceNote v

   _ -> mempty ""
  where
   parseVoiceNote :: A.Value -> T.Parser VoiceNote
   parseVoiceNote = A.withObject "VoiceNote" $ \o -> do
    voice <- o A..: "voice"
    mime_type <- o A..: "mime_type"
    waveform <- o A..: "waveform"
    duration <- o A..: "duration"
    return $ VoiceNote { voice = voice, mime_type = mime_type, waveform = waveform, duration = duration }