module TD.Query.RemoveAllFilesFromDownloads(RemoveAllFilesFromDownloads(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data RemoveAllFilesFromDownloads -- ^ Removes all files from the file download list
  = RemoveAllFilesFromDownloads
    { only_active       :: Maybe Bool -- ^ Pass true to remove only active downloads, including paused
    , only_completed    :: Maybe Bool -- ^ Pass true to remove only completed downloads
    , delete_from_cache :: Maybe Bool -- ^ Pass true to delete the file from the TDLib file cache
    }
  deriving (Eq)

instance Show RemoveAllFilesFromDownloads where
  show
    RemoveAllFilesFromDownloads
      { only_active       = only_active_
      , only_completed    = only_completed_
      , delete_from_cache = delete_from_cache_
      }
        = "RemoveAllFilesFromDownloads"
          ++ I.cc
          [ "only_active"       `I.p` only_active_
          , "only_completed"    `I.p` only_completed_
          , "delete_from_cache" `I.p` delete_from_cache_
          ]

instance AT.ToJSON RemoveAllFilesFromDownloads where
  toJSON
    RemoveAllFilesFromDownloads
      { only_active       = only_active_
      , only_completed    = only_completed_
      , delete_from_cache = delete_from_cache_
      }
        = A.object
          [ "@type"             A..= AT.String "removeAllFilesFromDownloads"
          , "only_active"       A..= only_active_
          , "only_completed"    A..= only_completed_
          , "delete_from_cache" A..= delete_from_cache_
          ]
