{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents the type of a file
data FileType
  = -- | The data is not a file
    FileTypeNone
  | -- | The file is an animation
    FileTypeAnimation
  | -- | The file is an audio file
    FileTypeAudio
  | -- | The file is a document
    FileTypeDocument
  | -- | The file is a notification sound
    FileTypeNotificationSound
  | -- | The file is a photo
    FileTypePhoto
  | -- | The file is a photo published as a story
    FileTypePhotoStory
  | -- | The file is a profile photo
    FileTypeProfilePhoto
  | -- | The file was sent to a secret chat (the file type is not known to the server)
    FileTypeSecret
  | -- | The file is a thumbnail of a file from a secret chat
    FileTypeSecretThumbnail
  | -- | The file is a file from Secure storage used for storing Telegram Passport files
    FileTypeSecure
  | -- | The file is a sticker
    FileTypeSticker
  | -- | The file is a thumbnail of another file
    FileTypeThumbnail
  | -- | The file type is not yet known
    FileTypeUnknown
  | -- | The file is a video
    FileTypeVideo
  | -- | The file is a video note
    FileTypeVideoNote
  | -- | The file is a video published as a story
    FileTypeVideoStory
  | -- | The file is a voice note
    FileTypeVoiceNote
  | -- | The file is a wallpaper or a background pattern
    FileTypeWallpaper
  deriving (Eq)

instance Show FileType where
  show FileTypeNone =
    "FileTypeNone"
      ++ U.cc
        []
  show FileTypeAnimation =
    "FileTypeAnimation"
      ++ U.cc
        []
  show FileTypeAudio =
    "FileTypeAudio"
      ++ U.cc
        []
  show FileTypeDocument =
    "FileTypeDocument"
      ++ U.cc
        []
  show FileTypeNotificationSound =
    "FileTypeNotificationSound"
      ++ U.cc
        []
  show FileTypePhoto =
    "FileTypePhoto"
      ++ U.cc
        []
  show FileTypePhotoStory =
    "FileTypePhotoStory"
      ++ U.cc
        []
  show FileTypeProfilePhoto =
    "FileTypeProfilePhoto"
      ++ U.cc
        []
  show FileTypeSecret =
    "FileTypeSecret"
      ++ U.cc
        []
  show FileTypeSecretThumbnail =
    "FileTypeSecretThumbnail"
      ++ U.cc
        []
  show FileTypeSecure =
    "FileTypeSecure"
      ++ U.cc
        []
  show FileTypeSticker =
    "FileTypeSticker"
      ++ U.cc
        []
  show FileTypeThumbnail =
    "FileTypeThumbnail"
      ++ U.cc
        []
  show FileTypeUnknown =
    "FileTypeUnknown"
      ++ U.cc
        []
  show FileTypeVideo =
    "FileTypeVideo"
      ++ U.cc
        []
  show FileTypeVideoNote =
    "FileTypeVideoNote"
      ++ U.cc
        []
  show FileTypeVideoStory =
    "FileTypeVideoStory"
      ++ U.cc
        []
  show FileTypeVoiceNote =
    "FileTypeVoiceNote"
      ++ U.cc
        []
  show FileTypeWallpaper =
    "FileTypeWallpaper"
      ++ U.cc
        []

instance T.FromJSON FileType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "fileTypeNone" -> parseFileTypeNone v
      "fileTypeAnimation" -> parseFileTypeAnimation v
      "fileTypeAudio" -> parseFileTypeAudio v
      "fileTypeDocument" -> parseFileTypeDocument v
      "fileTypeNotificationSound" -> parseFileTypeNotificationSound v
      "fileTypePhoto" -> parseFileTypePhoto v
      "fileTypePhotoStory" -> parseFileTypePhotoStory v
      "fileTypeProfilePhoto" -> parseFileTypeProfilePhoto v
      "fileTypeSecret" -> parseFileTypeSecret v
      "fileTypeSecretThumbnail" -> parseFileTypeSecretThumbnail v
      "fileTypeSecure" -> parseFileTypeSecure v
      "fileTypeSticker" -> parseFileTypeSticker v
      "fileTypeThumbnail" -> parseFileTypeThumbnail v
      "fileTypeUnknown" -> parseFileTypeUnknown v
      "fileTypeVideo" -> parseFileTypeVideo v
      "fileTypeVideoNote" -> parseFileTypeVideoNote v
      "fileTypeVideoStory" -> parseFileTypeVideoStory v
      "fileTypeVoiceNote" -> parseFileTypeVoiceNote v
      "fileTypeWallpaper" -> parseFileTypeWallpaper v
      _ -> mempty
    where
      parseFileTypeNone :: A.Value -> T.Parser FileType
      parseFileTypeNone = A.withObject "FileTypeNone" $ \_ -> return FileTypeNone

      parseFileTypeAnimation :: A.Value -> T.Parser FileType
      parseFileTypeAnimation = A.withObject "FileTypeAnimation" $ \_ -> return FileTypeAnimation

      parseFileTypeAudio :: A.Value -> T.Parser FileType
      parseFileTypeAudio = A.withObject "FileTypeAudio" $ \_ -> return FileTypeAudio

      parseFileTypeDocument :: A.Value -> T.Parser FileType
      parseFileTypeDocument = A.withObject "FileTypeDocument" $ \_ -> return FileTypeDocument

      parseFileTypeNotificationSound :: A.Value -> T.Parser FileType
      parseFileTypeNotificationSound = A.withObject "FileTypeNotificationSound" $ \_ -> return FileTypeNotificationSound

      parseFileTypePhoto :: A.Value -> T.Parser FileType
      parseFileTypePhoto = A.withObject "FileTypePhoto" $ \_ -> return FileTypePhoto

      parseFileTypePhotoStory :: A.Value -> T.Parser FileType
      parseFileTypePhotoStory = A.withObject "FileTypePhotoStory" $ \_ -> return FileTypePhotoStory

      parseFileTypeProfilePhoto :: A.Value -> T.Parser FileType
      parseFileTypeProfilePhoto = A.withObject "FileTypeProfilePhoto" $ \_ -> return FileTypeProfilePhoto

      parseFileTypeSecret :: A.Value -> T.Parser FileType
      parseFileTypeSecret = A.withObject "FileTypeSecret" $ \_ -> return FileTypeSecret

      parseFileTypeSecretThumbnail :: A.Value -> T.Parser FileType
      parseFileTypeSecretThumbnail = A.withObject "FileTypeSecretThumbnail" $ \_ -> return FileTypeSecretThumbnail

      parseFileTypeSecure :: A.Value -> T.Parser FileType
      parseFileTypeSecure = A.withObject "FileTypeSecure" $ \_ -> return FileTypeSecure

      parseFileTypeSticker :: A.Value -> T.Parser FileType
      parseFileTypeSticker = A.withObject "FileTypeSticker" $ \_ -> return FileTypeSticker

      parseFileTypeThumbnail :: A.Value -> T.Parser FileType
      parseFileTypeThumbnail = A.withObject "FileTypeThumbnail" $ \_ -> return FileTypeThumbnail

      parseFileTypeUnknown :: A.Value -> T.Parser FileType
      parseFileTypeUnknown = A.withObject "FileTypeUnknown" $ \_ -> return FileTypeUnknown

      parseFileTypeVideo :: A.Value -> T.Parser FileType
      parseFileTypeVideo = A.withObject "FileTypeVideo" $ \_ -> return FileTypeVideo

      parseFileTypeVideoNote :: A.Value -> T.Parser FileType
      parseFileTypeVideoNote = A.withObject "FileTypeVideoNote" $ \_ -> return FileTypeVideoNote

      parseFileTypeVideoStory :: A.Value -> T.Parser FileType
      parseFileTypeVideoStory = A.withObject "FileTypeVideoStory" $ \_ -> return FileTypeVideoStory

      parseFileTypeVoiceNote :: A.Value -> T.Parser FileType
      parseFileTypeVoiceNote = A.withObject "FileTypeVoiceNote" $ \_ -> return FileTypeVoiceNote

      parseFileTypeWallpaper :: A.Value -> T.Parser FileType
      parseFileTypeWallpaper = A.withObject "FileTypeWallpaper" $ \_ -> return FileTypeWallpaper
  parseJSON _ = mempty

instance T.ToJSON FileType where
  toJSON FileTypeNone =
    A.object
      [ "@type" A..= T.String "fileTypeNone"
      ]
  toJSON FileTypeAnimation =
    A.object
      [ "@type" A..= T.String "fileTypeAnimation"
      ]
  toJSON FileTypeAudio =
    A.object
      [ "@type" A..= T.String "fileTypeAudio"
      ]
  toJSON FileTypeDocument =
    A.object
      [ "@type" A..= T.String "fileTypeDocument"
      ]
  toJSON FileTypeNotificationSound =
    A.object
      [ "@type" A..= T.String "fileTypeNotificationSound"
      ]
  toJSON FileTypePhoto =
    A.object
      [ "@type" A..= T.String "fileTypePhoto"
      ]
  toJSON FileTypePhotoStory =
    A.object
      [ "@type" A..= T.String "fileTypePhotoStory"
      ]
  toJSON FileTypeProfilePhoto =
    A.object
      [ "@type" A..= T.String "fileTypeProfilePhoto"
      ]
  toJSON FileTypeSecret =
    A.object
      [ "@type" A..= T.String "fileTypeSecret"
      ]
  toJSON FileTypeSecretThumbnail =
    A.object
      [ "@type" A..= T.String "fileTypeSecretThumbnail"
      ]
  toJSON FileTypeSecure =
    A.object
      [ "@type" A..= T.String "fileTypeSecure"
      ]
  toJSON FileTypeSticker =
    A.object
      [ "@type" A..= T.String "fileTypeSticker"
      ]
  toJSON FileTypeThumbnail =
    A.object
      [ "@type" A..= T.String "fileTypeThumbnail"
      ]
  toJSON FileTypeUnknown =
    A.object
      [ "@type" A..= T.String "fileTypeUnknown"
      ]
  toJSON FileTypeVideo =
    A.object
      [ "@type" A..= T.String "fileTypeVideo"
      ]
  toJSON FileTypeVideoNote =
    A.object
      [ "@type" A..= T.String "fileTypeVideoNote"
      ]
  toJSON FileTypeVideoStory =
    A.object
      [ "@type" A..= T.String "fileTypeVideoStory"
      ]
  toJSON FileTypeVoiceNote =
    A.object
      [ "@type" A..= T.String "fileTypeVoiceNote"
      ]
  toJSON FileTypeWallpaper =
    A.object
      [ "@type" A..= T.String "fileTypeWallpaper"
      ]
