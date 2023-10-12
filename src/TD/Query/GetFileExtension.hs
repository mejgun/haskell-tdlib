module TD.Query.GetFileExtension where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetFileExtension -- ^ Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously
  = GetFileExtension
    { mime_type :: Maybe T.Text -- ^ The MIME type of the file
    }
  deriving (Eq)

instance Show GetFileExtension where
  show
    GetFileExtension
      { mime_type = mime_type_
      }
        = "GetFileExtension"
          ++ I.cc
          [ "mime_type" `I.p` mime_type_
          ]

instance AT.ToJSON GetFileExtension where
  toJSON
    GetFileExtension
      { mime_type = mime_type_
      }
        = A.object
          [ "@type"     A..= AT.String "getFileExtension"
          , "mime_type" A..= mime_type_
          ]
