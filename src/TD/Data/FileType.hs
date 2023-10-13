module TD.Data.FileType (FileType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data FileType -- ^ Represents the type of a file
  = FileTypeNone -- ^ The data is not a file
  | FileTypeAnimation -- ^ The file is an animation
  | FileTypeAudio -- ^ The file is an audio file
  | FileTypeDocument -- ^ The file is a document
  | FileTypeNotificationSound -- ^ The file is a notification sound
  | FileTypePhoto -- ^ The file is a photo
  | FileTypePhotoStory -- ^ The file is a photo published as a story
  | FileTypeProfilePhoto -- ^ The file is a profile photo
  | FileTypeSecret -- ^ The file was sent to a secret chat (the file type is not known to the server)
  | FileTypeSecretThumbnail -- ^ The file is a thumbnail of a file from a secret chat
  | FileTypeSecure -- ^ The file is a file from Secure storage used for storing Telegram Passport files
  | FileTypeSticker -- ^ The file is a sticker
  | FileTypeThumbnail -- ^ The file is a thumbnail of another file
  | FileTypeUnknown -- ^ The file type is not yet known
  | FileTypeVideo -- ^ The file is a video
  | FileTypeVideoNote -- ^ The file is a video note
  | FileTypeVideoStory -- ^ The file is a video published as a story
  | FileTypeVoiceNote -- ^ The file is a voice note
  | FileTypeWallpaper -- ^ The file is a wallpaper or a background pattern
  deriving (Eq)

instance Show FileType where
  show FileTypeNone
      = "FileTypeNone"
  show FileTypeAnimation
      = "FileTypeAnimation"
  show FileTypeAudio
      = "FileTypeAudio"
  show FileTypeDocument
      = "FileTypeDocument"
  show FileTypeNotificationSound
      = "FileTypeNotificationSound"
  show FileTypePhoto
      = "FileTypePhoto"
  show FileTypePhotoStory
      = "FileTypePhotoStory"
  show FileTypeProfilePhoto
      = "FileTypeProfilePhoto"
  show FileTypeSecret
      = "FileTypeSecret"
  show FileTypeSecretThumbnail
      = "FileTypeSecretThumbnail"
  show FileTypeSecure
      = "FileTypeSecure"
  show FileTypeSticker
      = "FileTypeSticker"
  show FileTypeThumbnail
      = "FileTypeThumbnail"
  show FileTypeUnknown
      = "FileTypeUnknown"
  show FileTypeVideo
      = "FileTypeVideo"
  show FileTypeVideoNote
      = "FileTypeVideoNote"
  show FileTypeVideoStory
      = "FileTypeVideoStory"
  show FileTypeVoiceNote
      = "FileTypeVoiceNote"
  show FileTypeWallpaper
      = "FileTypeWallpaper"

instance AT.FromJSON FileType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "fileTypeNone"              -> pure FileTypeNone
      "fileTypeAnimation"         -> pure FileTypeAnimation
      "fileTypeAudio"             -> pure FileTypeAudio
      "fileTypeDocument"          -> pure FileTypeDocument
      "fileTypeNotificationSound" -> pure FileTypeNotificationSound
      "fileTypePhoto"             -> pure FileTypePhoto
      "fileTypePhotoStory"        -> pure FileTypePhotoStory
      "fileTypeProfilePhoto"      -> pure FileTypeProfilePhoto
      "fileTypeSecret"            -> pure FileTypeSecret
      "fileTypeSecretThumbnail"   -> pure FileTypeSecretThumbnail
      "fileTypeSecure"            -> pure FileTypeSecure
      "fileTypeSticker"           -> pure FileTypeSticker
      "fileTypeThumbnail"         -> pure FileTypeThumbnail
      "fileTypeUnknown"           -> pure FileTypeUnknown
      "fileTypeVideo"             -> pure FileTypeVideo
      "fileTypeVideoNote"         -> pure FileTypeVideoNote
      "fileTypeVideoStory"        -> pure FileTypeVideoStory
      "fileTypeVoiceNote"         -> pure FileTypeVoiceNote
      "fileTypeWallpaper"         -> pure FileTypeWallpaper
      _                           -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON FileType where
  toJSON FileTypeNone
      = A.object
        [ "@type" A..= AT.String "fileTypeNone"
        ]
  toJSON FileTypeAnimation
      = A.object
        [ "@type" A..= AT.String "fileTypeAnimation"
        ]
  toJSON FileTypeAudio
      = A.object
        [ "@type" A..= AT.String "fileTypeAudio"
        ]
  toJSON FileTypeDocument
      = A.object
        [ "@type" A..= AT.String "fileTypeDocument"
        ]
  toJSON FileTypeNotificationSound
      = A.object
        [ "@type" A..= AT.String "fileTypeNotificationSound"
        ]
  toJSON FileTypePhoto
      = A.object
        [ "@type" A..= AT.String "fileTypePhoto"
        ]
  toJSON FileTypePhotoStory
      = A.object
        [ "@type" A..= AT.String "fileTypePhotoStory"
        ]
  toJSON FileTypeProfilePhoto
      = A.object
        [ "@type" A..= AT.String "fileTypeProfilePhoto"
        ]
  toJSON FileTypeSecret
      = A.object
        [ "@type" A..= AT.String "fileTypeSecret"
        ]
  toJSON FileTypeSecretThumbnail
      = A.object
        [ "@type" A..= AT.String "fileTypeSecretThumbnail"
        ]
  toJSON FileTypeSecure
      = A.object
        [ "@type" A..= AT.String "fileTypeSecure"
        ]
  toJSON FileTypeSticker
      = A.object
        [ "@type" A..= AT.String "fileTypeSticker"
        ]
  toJSON FileTypeThumbnail
      = A.object
        [ "@type" A..= AT.String "fileTypeThumbnail"
        ]
  toJSON FileTypeUnknown
      = A.object
        [ "@type" A..= AT.String "fileTypeUnknown"
        ]
  toJSON FileTypeVideo
      = A.object
        [ "@type" A..= AT.String "fileTypeVideo"
        ]
  toJSON FileTypeVideoNote
      = A.object
        [ "@type" A..= AT.String "fileTypeVideoNote"
        ]
  toJSON FileTypeVideoStory
      = A.object
        [ "@type" A..= AT.String "fileTypeVideoStory"
        ]
  toJSON FileTypeVoiceNote
      = A.object
        [ "@type" A..= AT.String "fileTypeVoiceNote"
        ]
  toJSON FileTypeWallpaper
      = A.object
        [ "@type" A..= AT.String "fileTypeWallpaper"
        ]
