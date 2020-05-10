-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FileType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents the type of a file
data FileType = 
 -- |
 -- 
 -- The data is not a file
 FileTypeNone |
 -- |
 -- 
 -- The file is an animation
 FileTypeAnimation |
 -- |
 -- 
 -- The file is an audio file
 FileTypeAudio |
 -- |
 -- 
 -- The file is a document
 FileTypeDocument |
 -- |
 -- 
 -- The file is a photo
 FileTypePhoto |
 -- |
 -- 
 -- The file is a profile photo
 FileTypeProfilePhoto |
 -- |
 -- 
 -- The file was sent to a secret chat (the file type is not known to the server)
 FileTypeSecret |
 -- |
 -- 
 -- The file is a thumbnail of a file from a secret chat
 FileTypeSecretThumbnail |
 -- |
 -- 
 -- The file is a file from Secure storage used for storing Telegram Passport files
 FileTypeSecure |
 -- |
 -- 
 -- The file is a sticker
 FileTypeSticker |
 -- |
 -- 
 -- The file is a thumbnail of another file
 FileTypeThumbnail |
 -- |
 -- 
 -- The file type is not yet known
 FileTypeUnknown |
 -- |
 -- 
 -- The file is a video
 FileTypeVideo |
 -- |
 -- 
 -- The file is a video note
 FileTypeVideoNote |
 -- |
 -- 
 -- The file is a voice note
 FileTypeVoiceNote |
 -- |
 -- 
 -- The file is a wallpaper or a background pattern
 FileTypeWallpaper deriving (Show, Eq)

instance T.ToJSON FileType where
 toJSON (FileTypeNone {  }) =
  A.object [ "@type" A..= T.String "fileTypeNone" ]

 toJSON (FileTypeAnimation {  }) =
  A.object [ "@type" A..= T.String "fileTypeAnimation" ]

 toJSON (FileTypeAudio {  }) =
  A.object [ "@type" A..= T.String "fileTypeAudio" ]

 toJSON (FileTypeDocument {  }) =
  A.object [ "@type" A..= T.String "fileTypeDocument" ]

 toJSON (FileTypePhoto {  }) =
  A.object [ "@type" A..= T.String "fileTypePhoto" ]

 toJSON (FileTypeProfilePhoto {  }) =
  A.object [ "@type" A..= T.String "fileTypeProfilePhoto" ]

 toJSON (FileTypeSecret {  }) =
  A.object [ "@type" A..= T.String "fileTypeSecret" ]

 toJSON (FileTypeSecretThumbnail {  }) =
  A.object [ "@type" A..= T.String "fileTypeSecretThumbnail" ]

 toJSON (FileTypeSecure {  }) =
  A.object [ "@type" A..= T.String "fileTypeSecure" ]

 toJSON (FileTypeSticker {  }) =
  A.object [ "@type" A..= T.String "fileTypeSticker" ]

 toJSON (FileTypeThumbnail {  }) =
  A.object [ "@type" A..= T.String "fileTypeThumbnail" ]

 toJSON (FileTypeUnknown {  }) =
  A.object [ "@type" A..= T.String "fileTypeUnknown" ]

 toJSON (FileTypeVideo {  }) =
  A.object [ "@type" A..= T.String "fileTypeVideo" ]

 toJSON (FileTypeVideoNote {  }) =
  A.object [ "@type" A..= T.String "fileTypeVideoNote" ]

 toJSON (FileTypeVoiceNote {  }) =
  A.object [ "@type" A..= T.String "fileTypeVoiceNote" ]

 toJSON (FileTypeWallpaper {  }) =
  A.object [ "@type" A..= T.String "fileTypeWallpaper" ]

instance T.FromJSON FileType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "fileTypeNone" -> parseFileTypeNone v
   "fileTypeAnimation" -> parseFileTypeAnimation v
   "fileTypeAudio" -> parseFileTypeAudio v
   "fileTypeDocument" -> parseFileTypeDocument v
   "fileTypePhoto" -> parseFileTypePhoto v
   "fileTypeProfilePhoto" -> parseFileTypeProfilePhoto v
   "fileTypeSecret" -> parseFileTypeSecret v
   "fileTypeSecretThumbnail" -> parseFileTypeSecretThumbnail v
   "fileTypeSecure" -> parseFileTypeSecure v
   "fileTypeSticker" -> parseFileTypeSticker v
   "fileTypeThumbnail" -> parseFileTypeThumbnail v
   "fileTypeUnknown" -> parseFileTypeUnknown v
   "fileTypeVideo" -> parseFileTypeVideo v
   "fileTypeVideoNote" -> parseFileTypeVideoNote v
   "fileTypeVoiceNote" -> parseFileTypeVoiceNote v
   "fileTypeWallpaper" -> parseFileTypeWallpaper v
   _ -> mempty
  where
   parseFileTypeNone :: A.Value -> T.Parser FileType
   parseFileTypeNone = A.withObject "FileTypeNone" $ \o -> do
    return $ FileTypeNone {  }

   parseFileTypeAnimation :: A.Value -> T.Parser FileType
   parseFileTypeAnimation = A.withObject "FileTypeAnimation" $ \o -> do
    return $ FileTypeAnimation {  }

   parseFileTypeAudio :: A.Value -> T.Parser FileType
   parseFileTypeAudio = A.withObject "FileTypeAudio" $ \o -> do
    return $ FileTypeAudio {  }

   parseFileTypeDocument :: A.Value -> T.Parser FileType
   parseFileTypeDocument = A.withObject "FileTypeDocument" $ \o -> do
    return $ FileTypeDocument {  }

   parseFileTypePhoto :: A.Value -> T.Parser FileType
   parseFileTypePhoto = A.withObject "FileTypePhoto" $ \o -> do
    return $ FileTypePhoto {  }

   parseFileTypeProfilePhoto :: A.Value -> T.Parser FileType
   parseFileTypeProfilePhoto = A.withObject "FileTypeProfilePhoto" $ \o -> do
    return $ FileTypeProfilePhoto {  }

   parseFileTypeSecret :: A.Value -> T.Parser FileType
   parseFileTypeSecret = A.withObject "FileTypeSecret" $ \o -> do
    return $ FileTypeSecret {  }

   parseFileTypeSecretThumbnail :: A.Value -> T.Parser FileType
   parseFileTypeSecretThumbnail = A.withObject "FileTypeSecretThumbnail" $ \o -> do
    return $ FileTypeSecretThumbnail {  }

   parseFileTypeSecure :: A.Value -> T.Parser FileType
   parseFileTypeSecure = A.withObject "FileTypeSecure" $ \o -> do
    return $ FileTypeSecure {  }

   parseFileTypeSticker :: A.Value -> T.Parser FileType
   parseFileTypeSticker = A.withObject "FileTypeSticker" $ \o -> do
    return $ FileTypeSticker {  }

   parseFileTypeThumbnail :: A.Value -> T.Parser FileType
   parseFileTypeThumbnail = A.withObject "FileTypeThumbnail" $ \o -> do
    return $ FileTypeThumbnail {  }

   parseFileTypeUnknown :: A.Value -> T.Parser FileType
   parseFileTypeUnknown = A.withObject "FileTypeUnknown" $ \o -> do
    return $ FileTypeUnknown {  }

   parseFileTypeVideo :: A.Value -> T.Parser FileType
   parseFileTypeVideo = A.withObject "FileTypeVideo" $ \o -> do
    return $ FileTypeVideo {  }

   parseFileTypeVideoNote :: A.Value -> T.Parser FileType
   parseFileTypeVideoNote = A.withObject "FileTypeVideoNote" $ \o -> do
    return $ FileTypeVideoNote {  }

   parseFileTypeVoiceNote :: A.Value -> T.Parser FileType
   parseFileTypeVoiceNote = A.withObject "FileTypeVoiceNote" $ \o -> do
    return $ FileTypeVoiceNote {  }

   parseFileTypeWallpaper :: A.Value -> T.Parser FileType
   parseFileTypeWallpaper = A.withObject "FileTypeWallpaper" $ \o -> do
    return $ FileTypeWallpaper {  }