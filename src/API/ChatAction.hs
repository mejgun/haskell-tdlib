-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatAction = 
 ChatActionTyping 
 | ChatActionRecordingVideo 
 | ChatActionUploadingVideo { progress :: Int }  
 | ChatActionRecordingVoiceNote 
 | ChatActionUploadingVoiceNote { progress :: Int }  
 | ChatActionUploadingPhoto { progress :: Int }  
 | ChatActionUploadingDocument { progress :: Int }  
 | ChatActionChoosingLocation 
 | ChatActionChoosingContact 
 | ChatActionStartPlayingGame 
 | ChatActionRecordingVideoNote 
 | ChatActionUploadingVideoNote { progress :: Int }  
 | ChatActionCancel -- deriving (Show)

instance T.ToJSON ChatAction where
 toJSON (ChatActionTyping {  }) =
  A.object [ "@type" A..= T.String "chatActionTyping" ]

 toJSON (ChatActionRecordingVideo {  }) =
  A.object [ "@type" A..= T.String "chatActionRecordingVideo" ]

 toJSON (ChatActionUploadingVideo { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingVideo", "progress" A..= progress ]

 toJSON (ChatActionRecordingVoiceNote {  }) =
  A.object [ "@type" A..= T.String "chatActionRecordingVoiceNote" ]

 toJSON (ChatActionUploadingVoiceNote { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingVoiceNote", "progress" A..= progress ]

 toJSON (ChatActionUploadingPhoto { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingPhoto", "progress" A..= progress ]

 toJSON (ChatActionUploadingDocument { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingDocument", "progress" A..= progress ]

 toJSON (ChatActionChoosingLocation {  }) =
  A.object [ "@type" A..= T.String "chatActionChoosingLocation" ]

 toJSON (ChatActionChoosingContact {  }) =
  A.object [ "@type" A..= T.String "chatActionChoosingContact" ]

 toJSON (ChatActionStartPlayingGame {  }) =
  A.object [ "@type" A..= T.String "chatActionStartPlayingGame" ]

 toJSON (ChatActionRecordingVideoNote {  }) =
  A.object [ "@type" A..= T.String "chatActionRecordingVideoNote" ]

 toJSON (ChatActionUploadingVideoNote { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingVideoNote", "progress" A..= progress ]

 toJSON (ChatActionCancel {  }) =
  A.object [ "@type" A..= T.String "chatActionCancel" ]
-- chatActionTyping ChatAction 

-- chatActionRecordingVideo ChatAction 

-- chatActionUploadingVideo ChatAction  { progress :: Int } 

-- chatActionRecordingVoiceNote ChatAction 

-- chatActionUploadingVoiceNote ChatAction  { progress :: Int } 

-- chatActionUploadingPhoto ChatAction  { progress :: Int } 

-- chatActionUploadingDocument ChatAction  { progress :: Int } 

-- chatActionChoosingLocation ChatAction 

-- chatActionChoosingContact ChatAction 

-- chatActionStartPlayingGame ChatAction 

-- chatActionRecordingVideoNote ChatAction 

-- chatActionUploadingVideoNote ChatAction  { progress :: Int } 

-- chatActionCancel ChatAction 

