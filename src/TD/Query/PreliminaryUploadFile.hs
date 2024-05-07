module TD.Query.PreliminaryUploadFile
  (PreliminaryUploadFile(..)
  , defaultPreliminaryUploadFile
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.FileType as FileType

-- | Preliminary uploads a file to the cloud before sending it in a message, which can be useful for uploading of being recorded voice and video notes. In all other cases there is no need to preliminary upload a file. Updates updateFile will be used to notify about upload progress. The upload will not be completed until the file is sent in a message. Returns 'TD.Data.File.File'
data PreliminaryUploadFile
  = PreliminaryUploadFile
    { file      :: Maybe InputFile.InputFile -- ^ File to upload
    , file_type :: Maybe FileType.FileType   -- ^ File type; pass null if unknown
    , priority  :: Maybe Int                 -- ^ Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which preliminaryUploadFile was called will be uploaded first
    }
  deriving (Eq, Show)

instance I.ShortShow PreliminaryUploadFile where
  shortShow
    PreliminaryUploadFile
      { file      = file_
      , file_type = file_type_
      , priority  = priority_
      }
        = "PreliminaryUploadFile"
          ++ I.cc
          [ "file"      `I.p` file_
          , "file_type" `I.p` file_type_
          , "priority"  `I.p` priority_
          ]

instance AT.ToJSON PreliminaryUploadFile where
  toJSON
    PreliminaryUploadFile
      { file      = file_
      , file_type = file_type_
      , priority  = priority_
      }
        = A.object
          [ "@type"     A..= AT.String "preliminaryUploadFile"
          , "file"      A..= file_
          , "file_type" A..= file_type_
          , "priority"  A..= priority_
          ]

defaultPreliminaryUploadFile :: PreliminaryUploadFile
defaultPreliminaryUploadFile =
  PreliminaryUploadFile
    { file      = Nothing
    , file_type = Nothing
    , priority  = Nothing
    }

