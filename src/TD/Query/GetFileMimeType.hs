module TD.Query.GetFileMimeType
  (GetFileMimeType(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can be called synchronously. Returns 'TD.Data.Text.Text'
data GetFileMimeType
  = GetFileMimeType
    { file_name :: Maybe T.Text -- ^ The name of the file or path to the file
    }
  deriving (Eq, Show)

instance I.ShortShow GetFileMimeType where
  shortShow
    GetFileMimeType
      { file_name = file_name_
      }
        = "GetFileMimeType"
          ++ I.cc
          [ "file_name" `I.p` file_name_
          ]

instance AT.ToJSON GetFileMimeType where
  toJSON
    GetFileMimeType
      { file_name = file_name_
      }
        = A.object
          [ "@type"     A..= AT.String "getFileMimeType"
          , "file_name" A..= file_name_
          ]

