module TD.Query.GetSuggestedFileName
  (GetSuggestedFileName(..)
  , defaultGetSuggestedFileName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns suggested name for saving a file in a given directory. Returns 'TD.Data.Text.Text'
data GetSuggestedFileName
  = GetSuggestedFileName
    { file_id   :: Maybe Int    -- ^ Identifier of the file
    , directory :: Maybe T.Text -- ^ Directory in which the file is expected to be saved
    }
  deriving (Eq, Show)

instance I.ShortShow GetSuggestedFileName where
  shortShow
    GetSuggestedFileName
      { file_id   = file_id_
      , directory = directory_
      }
        = "GetSuggestedFileName"
          ++ I.cc
          [ "file_id"   `I.p` file_id_
          , "directory" `I.p` directory_
          ]

instance AT.ToJSON GetSuggestedFileName where
  toJSON
    GetSuggestedFileName
      { file_id   = file_id_
      , directory = directory_
      }
        = A.object
          [ "@type"     A..= AT.String "getSuggestedFileName"
          , "file_id"   A..= file_id_
          , "directory" A..= directory_
          ]

defaultGetSuggestedFileName :: GetSuggestedFileName
defaultGetSuggestedFileName =
  GetSuggestedFileName
    { file_id   = Nothing
    , directory = Nothing
    }

