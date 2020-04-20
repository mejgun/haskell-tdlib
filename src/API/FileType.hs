-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data FileType = 
 FileTypeNone 
 | FileTypeAnimation 
 | FileTypeAudio 
 | FileTypeDocument 
 | FileTypePhoto 
 | FileTypeProfilePhoto 
 | FileTypeSecret 
 | FileTypeSecretThumbnail 
 | FileTypeSecure 
 | FileTypeSticker 
 | FileTypeThumbnail 
 | FileTypeUnknown 
 | FileTypeVideo 
 | FileTypeVideoNote 
 | FileTypeVoiceNote 
 | FileTypeWallpaper -- deriving (Show)

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
-- fileTypeNone FileType 

-- fileTypeAnimation FileType 

-- fileTypeAudio FileType 

-- fileTypeDocument FileType 

-- fileTypePhoto FileType 

-- fileTypeProfilePhoto FileType 

-- fileTypeSecret FileType 

-- fileTypeSecretThumbnail FileType 

-- fileTypeSecure FileType 

-- fileTypeSticker FileType 

-- fileTypeThumbnail FileType 

-- fileTypeUnknown FileType 

-- fileTypeVideo FileType 

-- fileTypeVideoNote FileType 

-- fileTypeVoiceNote FileType 

-- fileTypeWallpaper FileType 

