{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the different types of activity in a chat
data ChatAction
  = -- | The user is typing a message
    ChatActionTyping
  | -- | The user is recording a video
    ChatActionRecordingVideo
  | -- | The user is uploading a video @progress Upload progress, as a percentage
    ChatActionUploadingVideo
      { -- |
        progress :: Maybe Int
      }
  | -- | The user is recording a voice note
    ChatActionRecordingVoiceNote
  | -- | The user is uploading a voice note @progress Upload progress, as a percentage
    ChatActionUploadingVoiceNote
      { -- |
        progress :: Maybe Int
      }
  | -- | The user is uploading a photo @progress Upload progress, as a percentage
    ChatActionUploadingPhoto
      { -- |
        progress :: Maybe Int
      }
  | -- | The user is uploading a document @progress Upload progress, as a percentage
    ChatActionUploadingDocument
      { -- |
        progress :: Maybe Int
      }
  | -- | The user is picking a sticker to send
    ChatActionChoosingSticker
  | -- | The user is picking a location or venue to send
    ChatActionChoosingLocation
  | -- | The user is picking a contact to send
    ChatActionChoosingContact
  | -- | The user has started to play a game
    ChatActionStartPlayingGame
  | -- | The user is recording a video note
    ChatActionRecordingVideoNote
  | -- | The user is uploading a video note @progress Upload progress, as a percentage
    ChatActionUploadingVideoNote
      { -- |
        progress :: Maybe Int
      }
  | -- | The user is watching animations sent by the other party by clicking on an animated emoji @emoji The animated emoji
    ChatActionWatchingAnimations
      { -- |
        emoji :: Maybe String
      }
  | -- | The user has canceled the previous action
    ChatActionCancel
  deriving (Eq)

instance Show ChatAction where
  show ChatActionTyping =
    "ChatActionTyping"
      ++ U.cc
        []
  show ChatActionRecordingVideo =
    "ChatActionRecordingVideo"
      ++ U.cc
        []
  show
    ChatActionUploadingVideo
      { progress = progress_
      } =
      "ChatActionUploadingVideo"
        ++ U.cc
          [ U.p "progress" progress_
          ]
  show ChatActionRecordingVoiceNote =
    "ChatActionRecordingVoiceNote"
      ++ U.cc
        []
  show
    ChatActionUploadingVoiceNote
      { progress = progress_
      } =
      "ChatActionUploadingVoiceNote"
        ++ U.cc
          [ U.p "progress" progress_
          ]
  show
    ChatActionUploadingPhoto
      { progress = progress_
      } =
      "ChatActionUploadingPhoto"
        ++ U.cc
          [ U.p "progress" progress_
          ]
  show
    ChatActionUploadingDocument
      { progress = progress_
      } =
      "ChatActionUploadingDocument"
        ++ U.cc
          [ U.p "progress" progress_
          ]
  show ChatActionChoosingSticker =
    "ChatActionChoosingSticker"
      ++ U.cc
        []
  show ChatActionChoosingLocation =
    "ChatActionChoosingLocation"
      ++ U.cc
        []
  show ChatActionChoosingContact =
    "ChatActionChoosingContact"
      ++ U.cc
        []
  show ChatActionStartPlayingGame =
    "ChatActionStartPlayingGame"
      ++ U.cc
        []
  show ChatActionRecordingVideoNote =
    "ChatActionRecordingVideoNote"
      ++ U.cc
        []
  show
    ChatActionUploadingVideoNote
      { progress = progress_
      } =
      "ChatActionUploadingVideoNote"
        ++ U.cc
          [ U.p "progress" progress_
          ]
  show
    ChatActionWatchingAnimations
      { emoji = emoji_
      } =
      "ChatActionWatchingAnimations"
        ++ U.cc
          [ U.p "emoji" emoji_
          ]
  show ChatActionCancel =
    "ChatActionCancel"
      ++ U.cc
        []

instance T.FromJSON ChatAction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatActionTyping" -> parseChatActionTyping v
      "chatActionRecordingVideo" -> parseChatActionRecordingVideo v
      "chatActionUploadingVideo" -> parseChatActionUploadingVideo v
      "chatActionRecordingVoiceNote" -> parseChatActionRecordingVoiceNote v
      "chatActionUploadingVoiceNote" -> parseChatActionUploadingVoiceNote v
      "chatActionUploadingPhoto" -> parseChatActionUploadingPhoto v
      "chatActionUploadingDocument" -> parseChatActionUploadingDocument v
      "chatActionChoosingSticker" -> parseChatActionChoosingSticker v
      "chatActionChoosingLocation" -> parseChatActionChoosingLocation v
      "chatActionChoosingContact" -> parseChatActionChoosingContact v
      "chatActionStartPlayingGame" -> parseChatActionStartPlayingGame v
      "chatActionRecordingVideoNote" -> parseChatActionRecordingVideoNote v
      "chatActionUploadingVideoNote" -> parseChatActionUploadingVideoNote v
      "chatActionWatchingAnimations" -> parseChatActionWatchingAnimations v
      "chatActionCancel" -> parseChatActionCancel v
      _ -> mempty
    where
      parseChatActionTyping :: A.Value -> T.Parser ChatAction
      parseChatActionTyping = A.withObject "ChatActionTyping" $ \_ -> return ChatActionTyping

      parseChatActionRecordingVideo :: A.Value -> T.Parser ChatAction
      parseChatActionRecordingVideo = A.withObject "ChatActionRecordingVideo" $ \_ -> return ChatActionRecordingVideo

      parseChatActionUploadingVideo :: A.Value -> T.Parser ChatAction
      parseChatActionUploadingVideo = A.withObject "ChatActionUploadingVideo" $ \o -> do
        progress_ <- mconcat [o A..:? "progress", U.rm <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatActionUploadingVideo {progress = progress_}

      parseChatActionRecordingVoiceNote :: A.Value -> T.Parser ChatAction
      parseChatActionRecordingVoiceNote = A.withObject "ChatActionRecordingVoiceNote" $ \_ -> return ChatActionRecordingVoiceNote

      parseChatActionUploadingVoiceNote :: A.Value -> T.Parser ChatAction
      parseChatActionUploadingVoiceNote = A.withObject "ChatActionUploadingVoiceNote" $ \o -> do
        progress_ <- mconcat [o A..:? "progress", U.rm <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatActionUploadingVoiceNote {progress = progress_}

      parseChatActionUploadingPhoto :: A.Value -> T.Parser ChatAction
      parseChatActionUploadingPhoto = A.withObject "ChatActionUploadingPhoto" $ \o -> do
        progress_ <- mconcat [o A..:? "progress", U.rm <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatActionUploadingPhoto {progress = progress_}

      parseChatActionUploadingDocument :: A.Value -> T.Parser ChatAction
      parseChatActionUploadingDocument = A.withObject "ChatActionUploadingDocument" $ \o -> do
        progress_ <- mconcat [o A..:? "progress", U.rm <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatActionUploadingDocument {progress = progress_}

      parseChatActionChoosingSticker :: A.Value -> T.Parser ChatAction
      parseChatActionChoosingSticker = A.withObject "ChatActionChoosingSticker" $ \_ -> return ChatActionChoosingSticker

      parseChatActionChoosingLocation :: A.Value -> T.Parser ChatAction
      parseChatActionChoosingLocation = A.withObject "ChatActionChoosingLocation" $ \_ -> return ChatActionChoosingLocation

      parseChatActionChoosingContact :: A.Value -> T.Parser ChatAction
      parseChatActionChoosingContact = A.withObject "ChatActionChoosingContact" $ \_ -> return ChatActionChoosingContact

      parseChatActionStartPlayingGame :: A.Value -> T.Parser ChatAction
      parseChatActionStartPlayingGame = A.withObject "ChatActionStartPlayingGame" $ \_ -> return ChatActionStartPlayingGame

      parseChatActionRecordingVideoNote :: A.Value -> T.Parser ChatAction
      parseChatActionRecordingVideoNote = A.withObject "ChatActionRecordingVideoNote" $ \_ -> return ChatActionRecordingVideoNote

      parseChatActionUploadingVideoNote :: A.Value -> T.Parser ChatAction
      parseChatActionUploadingVideoNote = A.withObject "ChatActionUploadingVideoNote" $ \o -> do
        progress_ <- mconcat [o A..:? "progress", U.rm <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatActionUploadingVideoNote {progress = progress_}

      parseChatActionWatchingAnimations :: A.Value -> T.Parser ChatAction
      parseChatActionWatchingAnimations = A.withObject "ChatActionWatchingAnimations" $ \o -> do
        emoji_ <- o A..:? "emoji"
        return $ ChatActionWatchingAnimations {emoji = emoji_}

      parseChatActionCancel :: A.Value -> T.Parser ChatAction
      parseChatActionCancel = A.withObject "ChatActionCancel" $ \_ -> return ChatActionCancel
  parseJSON _ = mempty

instance T.ToJSON ChatAction where
  toJSON ChatActionTyping =
    A.object
      [ "@type" A..= T.String "chatActionTyping"
      ]
  toJSON ChatActionRecordingVideo =
    A.object
      [ "@type" A..= T.String "chatActionRecordingVideo"
      ]
  toJSON
    ChatActionUploadingVideo
      { progress = progress_
      } =
      A.object
        [ "@type" A..= T.String "chatActionUploadingVideo",
          "progress" A..= progress_
        ]
  toJSON ChatActionRecordingVoiceNote =
    A.object
      [ "@type" A..= T.String "chatActionRecordingVoiceNote"
      ]
  toJSON
    ChatActionUploadingVoiceNote
      { progress = progress_
      } =
      A.object
        [ "@type" A..= T.String "chatActionUploadingVoiceNote",
          "progress" A..= progress_
        ]
  toJSON
    ChatActionUploadingPhoto
      { progress = progress_
      } =
      A.object
        [ "@type" A..= T.String "chatActionUploadingPhoto",
          "progress" A..= progress_
        ]
  toJSON
    ChatActionUploadingDocument
      { progress = progress_
      } =
      A.object
        [ "@type" A..= T.String "chatActionUploadingDocument",
          "progress" A..= progress_
        ]
  toJSON ChatActionChoosingSticker =
    A.object
      [ "@type" A..= T.String "chatActionChoosingSticker"
      ]
  toJSON ChatActionChoosingLocation =
    A.object
      [ "@type" A..= T.String "chatActionChoosingLocation"
      ]
  toJSON ChatActionChoosingContact =
    A.object
      [ "@type" A..= T.String "chatActionChoosingContact"
      ]
  toJSON ChatActionStartPlayingGame =
    A.object
      [ "@type" A..= T.String "chatActionStartPlayingGame"
      ]
  toJSON ChatActionRecordingVideoNote =
    A.object
      [ "@type" A..= T.String "chatActionRecordingVideoNote"
      ]
  toJSON
    ChatActionUploadingVideoNote
      { progress = progress_
      } =
      A.object
        [ "@type" A..= T.String "chatActionUploadingVideoNote",
          "progress" A..= progress_
        ]
  toJSON
    ChatActionWatchingAnimations
      { emoji = emoji_
      } =
      A.object
        [ "@type" A..= T.String "chatActionWatchingAnimations",
          "emoji" A..= emoji_
        ]
  toJSON ChatActionCancel =
    A.object
      [ "@type" A..= T.String "chatActionCancel"
      ]
