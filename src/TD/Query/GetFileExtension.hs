module TD.Query.GetFileExtension
  (GetFileExtension(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously. Returns 'TD.Data.Text.Text'
data GetFileExtension
  = GetFileExtension
    { mime_type :: Maybe T.Text -- ^ The MIME type of the file
    }
  deriving (Eq, Show)

instance I.ShortShow GetFileExtension where
  shortShow
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

