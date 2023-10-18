module TD.Query.GetFile
  (GetFile(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a file; this is an offline request. Returns 'TD.Data.File.File'
data GetFile
  = GetFile
    { file_id :: Maybe Int -- ^ Identifier of the file to get
    }
  deriving (Eq, Show)

instance I.ShortShow GetFile where
  shortShow
    GetFile
      { file_id = file_id_
      }
        = "GetFile"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          ]

instance AT.ToJSON GetFile where
  toJSON
    GetFile
      { file_id = file_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getFile"
          , "file_id" A..= file_id_
          ]

