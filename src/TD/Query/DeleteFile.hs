module TD.Query.DeleteFile
  (DeleteFile(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a file from the TDLib file cache. Returns 'TD.Data.Ok.Ok'
data DeleteFile
  = DeleteFile
    { file_id :: Maybe Int -- ^ Identifier of the file to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteFile where
  shortShow
    DeleteFile
      { file_id = file_id_
      }
        = "DeleteFile"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          ]

instance AT.ToJSON DeleteFile where
  toJSON
    DeleteFile
      { file_id = file_id_
      }
        = A.object
          [ "@type"   A..= AT.String "deleteFile"
          , "file_id" A..= file_id_
          ]

