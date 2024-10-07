module TD.Query.CancelPreliminaryUploadFile
  (CancelPreliminaryUploadFile(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Stops the preliminary uploading of a file. Supported only for files uploaded by using preliminaryUploadFile. Returns 'TD.Data.Ok.Ok'
data CancelPreliminaryUploadFile
  = CancelPreliminaryUploadFile
    { file_id :: Maybe Int -- ^ Identifier of the file to stop uploading
    }
  deriving (Eq, Show)

instance I.ShortShow CancelPreliminaryUploadFile where
  shortShow
    CancelPreliminaryUploadFile
      { file_id = file_id_
      }
        = "CancelPreliminaryUploadFile"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          ]

instance AT.ToJSON CancelPreliminaryUploadFile where
  toJSON
    CancelPreliminaryUploadFile
      { file_id = file_id_
      }
        = A.object
          [ "@type"   A..= AT.String "cancelPreliminaryUploadFile"
          , "file_id" A..= file_id_
          ]

