module TD.Query.CleanFileName
  (CleanFileName(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Removes potentially dangerous characters from the name of a file. Returns an empty string on failure. Can be called synchronously. Returns 'TD.Data.Text.Text'
data CleanFileName
  = CleanFileName
    { file_name :: Maybe T.Text -- ^ File name or path to the file
    }
  deriving (Eq, Show)

instance I.ShortShow CleanFileName where
  shortShow
    CleanFileName
      { file_name = file_name_
      }
        = "CleanFileName"
          ++ I.cc
          [ "file_name" `I.p` file_name_
          ]

instance AT.ToJSON CleanFileName where
  toJSON
    CleanFileName
      { file_name = file_name_
      }
        = A.object
          [ "@type"     A..= AT.String "cleanFileName"
          , "file_name" A..= file_name_
          ]

