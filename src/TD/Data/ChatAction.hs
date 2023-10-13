module TD.Data.ChatAction
  ( ChatAction(..)                      
  , defaultChatActionUploadingVideo     
  , defaultChatActionUploadingVoiceNote 
  , defaultChatActionUploadingPhoto     
  , defaultChatActionUploadingDocument  
  , defaultChatActionUploadingVideoNote 
  , defaultChatActionWatchingAnimations 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes the different types of activity in a chat
data ChatAction
  = ChatActionTyping -- ^ The user is typing a message
  | ChatActionRecordingVideo -- ^ The user is recording a video
  | ChatActionUploadingVideo -- ^ The user is uploading a video
    { progress :: Maybe Int -- ^ Upload progress, as a percentage
    }
  | ChatActionRecordingVoiceNote -- ^ The user is recording a voice note
  | ChatActionUploadingVoiceNote -- ^ The user is uploading a voice note
    { progress :: Maybe Int -- ^ Upload progress, as a percentage
    }
  | ChatActionUploadingPhoto -- ^ The user is uploading a photo
    { progress :: Maybe Int -- ^ Upload progress, as a percentage
    }
  | ChatActionUploadingDocument -- ^ The user is uploading a document
    { progress :: Maybe Int -- ^ Upload progress, as a percentage
    }
  | ChatActionChoosingSticker -- ^ The user is picking a sticker to send
  | ChatActionChoosingLocation -- ^ The user is picking a location or venue to send
  | ChatActionChoosingContact -- ^ The user is picking a contact to send
  | ChatActionStartPlayingGame -- ^ The user has started to play a game
  | ChatActionRecordingVideoNote -- ^ The user is recording a video note
  | ChatActionUploadingVideoNote -- ^ The user is uploading a video note
    { progress :: Maybe Int -- ^ Upload progress, as a percentage
    }
  | ChatActionWatchingAnimations -- ^ The user is watching animations sent by the other party by clicking on an animated emoji
    { emoji :: Maybe T.Text -- ^ The animated emoji
    }
  | ChatActionCancel -- ^ The user has canceled the previous action
  deriving (Eq)

instance Show ChatAction where
  show ChatActionTyping
      = "ChatActionTyping"
  show ChatActionRecordingVideo
      = "ChatActionRecordingVideo"
  show ChatActionUploadingVideo
    { progress = progress_
    }
      = "ChatActionUploadingVideo"
        ++ I.cc
        [ "progress" `I.p` progress_
        ]
  show ChatActionRecordingVoiceNote
      = "ChatActionRecordingVoiceNote"
  show ChatActionUploadingVoiceNote
    { progress = progress_
    }
      = "ChatActionUploadingVoiceNote"
        ++ I.cc
        [ "progress" `I.p` progress_
        ]
  show ChatActionUploadingPhoto
    { progress = progress_
    }
      = "ChatActionUploadingPhoto"
        ++ I.cc
        [ "progress" `I.p` progress_
        ]
  show ChatActionUploadingDocument
    { progress = progress_
    }
      = "ChatActionUploadingDocument"
        ++ I.cc
        [ "progress" `I.p` progress_
        ]
  show ChatActionChoosingSticker
      = "ChatActionChoosingSticker"
  show ChatActionChoosingLocation
      = "ChatActionChoosingLocation"
  show ChatActionChoosingContact
      = "ChatActionChoosingContact"
  show ChatActionStartPlayingGame
      = "ChatActionStartPlayingGame"
  show ChatActionRecordingVideoNote
      = "ChatActionRecordingVideoNote"
  show ChatActionUploadingVideoNote
    { progress = progress_
    }
      = "ChatActionUploadingVideoNote"
        ++ I.cc
        [ "progress" `I.p` progress_
        ]
  show ChatActionWatchingAnimations
    { emoji = emoji_
    }
      = "ChatActionWatchingAnimations"
        ++ I.cc
        [ "emoji" `I.p` emoji_
        ]
  show ChatActionCancel
      = "ChatActionCancel"

instance AT.FromJSON ChatAction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatActionTyping"             -> pure ChatActionTyping
      "chatActionRecordingVideo"     -> pure ChatActionRecordingVideo
      "chatActionUploadingVideo"     -> parseChatActionUploadingVideo v
      "chatActionRecordingVoiceNote" -> pure ChatActionRecordingVoiceNote
      "chatActionUploadingVoiceNote" -> parseChatActionUploadingVoiceNote v
      "chatActionUploadingPhoto"     -> parseChatActionUploadingPhoto v
      "chatActionUploadingDocument"  -> parseChatActionUploadingDocument v
      "chatActionChoosingSticker"    -> pure ChatActionChoosingSticker
      "chatActionChoosingLocation"   -> pure ChatActionChoosingLocation
      "chatActionChoosingContact"    -> pure ChatActionChoosingContact
      "chatActionStartPlayingGame"   -> pure ChatActionStartPlayingGame
      "chatActionRecordingVideoNote" -> pure ChatActionRecordingVideoNote
      "chatActionUploadingVideoNote" -> parseChatActionUploadingVideoNote v
      "chatActionWatchingAnimations" -> parseChatActionWatchingAnimations v
      "chatActionCancel"             -> pure ChatActionCancel
      _                              -> mempty
    
    where
      parseChatActionUploadingVideo :: A.Value -> AT.Parser ChatAction
      parseChatActionUploadingVideo = A.withObject "ChatActionUploadingVideo" $ \o -> do
        progress_ <- o A..:?  "progress"
        pure $ ChatActionUploadingVideo
          { progress = progress_
          }
      parseChatActionUploadingVoiceNote :: A.Value -> AT.Parser ChatAction
      parseChatActionUploadingVoiceNote = A.withObject "ChatActionUploadingVoiceNote" $ \o -> do
        progress_ <- o A..:?  "progress"
        pure $ ChatActionUploadingVoiceNote
          { progress = progress_
          }
      parseChatActionUploadingPhoto :: A.Value -> AT.Parser ChatAction
      parseChatActionUploadingPhoto = A.withObject "ChatActionUploadingPhoto" $ \o -> do
        progress_ <- o A..:?  "progress"
        pure $ ChatActionUploadingPhoto
          { progress = progress_
          }
      parseChatActionUploadingDocument :: A.Value -> AT.Parser ChatAction
      parseChatActionUploadingDocument = A.withObject "ChatActionUploadingDocument" $ \o -> do
        progress_ <- o A..:?  "progress"
        pure $ ChatActionUploadingDocument
          { progress = progress_
          }
      parseChatActionUploadingVideoNote :: A.Value -> AT.Parser ChatAction
      parseChatActionUploadingVideoNote = A.withObject "ChatActionUploadingVideoNote" $ \o -> do
        progress_ <- o A..:?  "progress"
        pure $ ChatActionUploadingVideoNote
          { progress = progress_
          }
      parseChatActionWatchingAnimations :: A.Value -> AT.Parser ChatAction
      parseChatActionWatchingAnimations = A.withObject "ChatActionWatchingAnimations" $ \o -> do
        emoji_ <- o A..:?  "emoji"
        pure $ ChatActionWatchingAnimations
          { emoji = emoji_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatAction where
  toJSON ChatActionTyping
      = A.object
        [ "@type" A..= AT.String "chatActionTyping"
        ]
  toJSON ChatActionRecordingVideo
      = A.object
        [ "@type" A..= AT.String "chatActionRecordingVideo"
        ]
  toJSON ChatActionUploadingVideo
    { progress = progress_
    }
      = A.object
        [ "@type"    A..= AT.String "chatActionUploadingVideo"
        , "progress" A..= progress_
        ]
  toJSON ChatActionRecordingVoiceNote
      = A.object
        [ "@type" A..= AT.String "chatActionRecordingVoiceNote"
        ]
  toJSON ChatActionUploadingVoiceNote
    { progress = progress_
    }
      = A.object
        [ "@type"    A..= AT.String "chatActionUploadingVoiceNote"
        , "progress" A..= progress_
        ]
  toJSON ChatActionUploadingPhoto
    { progress = progress_
    }
      = A.object
        [ "@type"    A..= AT.String "chatActionUploadingPhoto"
        , "progress" A..= progress_
        ]
  toJSON ChatActionUploadingDocument
    { progress = progress_
    }
      = A.object
        [ "@type"    A..= AT.String "chatActionUploadingDocument"
        , "progress" A..= progress_
        ]
  toJSON ChatActionChoosingSticker
      = A.object
        [ "@type" A..= AT.String "chatActionChoosingSticker"
        ]
  toJSON ChatActionChoosingLocation
      = A.object
        [ "@type" A..= AT.String "chatActionChoosingLocation"
        ]
  toJSON ChatActionChoosingContact
      = A.object
        [ "@type" A..= AT.String "chatActionChoosingContact"
        ]
  toJSON ChatActionStartPlayingGame
      = A.object
        [ "@type" A..= AT.String "chatActionStartPlayingGame"
        ]
  toJSON ChatActionRecordingVideoNote
      = A.object
        [ "@type" A..= AT.String "chatActionRecordingVideoNote"
        ]
  toJSON ChatActionUploadingVideoNote
    { progress = progress_
    }
      = A.object
        [ "@type"    A..= AT.String "chatActionUploadingVideoNote"
        , "progress" A..= progress_
        ]
  toJSON ChatActionWatchingAnimations
    { emoji = emoji_
    }
      = A.object
        [ "@type" A..= AT.String "chatActionWatchingAnimations"
        , "emoji" A..= emoji_
        ]
  toJSON ChatActionCancel
      = A.object
        [ "@type" A..= AT.String "chatActionCancel"
        ]

defaultChatActionUploadingVideo :: ChatAction
defaultChatActionUploadingVideo =
  ChatActionUploadingVideo
    { progress = Nothing
    }

defaultChatActionUploadingVoiceNote :: ChatAction
defaultChatActionUploadingVoiceNote =
  ChatActionUploadingVoiceNote
    { progress = Nothing
    }

defaultChatActionUploadingPhoto :: ChatAction
defaultChatActionUploadingPhoto =
  ChatActionUploadingPhoto
    { progress = Nothing
    }

defaultChatActionUploadingDocument :: ChatAction
defaultChatActionUploadingDocument =
  ChatActionUploadingDocument
    { progress = Nothing
    }

defaultChatActionUploadingVideoNote :: ChatAction
defaultChatActionUploadingVideoNote =
  ChatActionUploadingVideoNote
    { progress = Nothing
    }

defaultChatActionWatchingAnimations :: ChatAction
defaultChatActionWatchingAnimations =
  ChatActionWatchingAnimations
    { emoji = Nothing
    }

