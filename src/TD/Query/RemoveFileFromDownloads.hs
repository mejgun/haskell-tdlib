module TD.Query.RemoveFileFromDownloads
  (RemoveFileFromDownloads(..)
  , defaultRemoveFileFromDownloads
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes a file from the file download list. Returns 'TD.Data.Ok.Ok'
data RemoveFileFromDownloads
  = RemoveFileFromDownloads
    { file_id           :: Maybe Int  -- ^ Identifier of the downloaded file
    , delete_from_cache :: Maybe Bool -- ^ Pass true to delete the file from the TDLib file cache
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveFileFromDownloads where
  shortShow
    RemoveFileFromDownloads
      { file_id           = file_id_
      , delete_from_cache = delete_from_cache_
      }
        = "RemoveFileFromDownloads"
          ++ I.cc
          [ "file_id"           `I.p` file_id_
          , "delete_from_cache" `I.p` delete_from_cache_
          ]

instance AT.ToJSON RemoveFileFromDownloads where
  toJSON
    RemoveFileFromDownloads
      { file_id           = file_id_
      , delete_from_cache = delete_from_cache_
      }
        = A.object
          [ "@type"             A..= AT.String "removeFileFromDownloads"
          , "file_id"           A..= file_id_
          , "delete_from_cache" A..= delete_from_cache_
          ]

defaultRemoveFileFromDownloads :: RemoveFileFromDownloads
defaultRemoveFileFromDownloads =
  RemoveFileFromDownloads
    { file_id           = Nothing
    , delete_from_cache = Nothing
    }

