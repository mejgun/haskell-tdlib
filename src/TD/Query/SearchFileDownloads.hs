module TD.Query.SearchFileDownloads
  (SearchFileDownloads(..)
  , defaultSearchFileDownloads
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for files in the file download list or recently downloaded files from the list. Returns 'TD.Data.FoundFileDownloads.FoundFileDownloads'
data SearchFileDownloads
  = SearchFileDownloads
    { query          :: Maybe T.Text -- ^ Query to search for; may be empty to return all downloaded files
    , only_active    :: Maybe Bool   -- ^ Pass true to search only for active downloads, including paused
    , only_completed :: Maybe Bool   -- ^ Pass true to search only for completed downloads
    , offset         :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit          :: Maybe Int    -- ^ The maximum number of files to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchFileDownloads where
  shortShow
    SearchFileDownloads
      { query          = query_
      , only_active    = only_active_
      , only_completed = only_completed_
      , offset         = offset_
      , limit          = limit_
      }
        = "SearchFileDownloads"
          ++ I.cc
          [ "query"          `I.p` query_
          , "only_active"    `I.p` only_active_
          , "only_completed" `I.p` only_completed_
          , "offset"         `I.p` offset_
          , "limit"          `I.p` limit_
          ]

instance AT.ToJSON SearchFileDownloads where
  toJSON
    SearchFileDownloads
      { query          = query_
      , only_active    = only_active_
      , only_completed = only_completed_
      , offset         = offset_
      , limit          = limit_
      }
        = A.object
          [ "@type"          A..= AT.String "searchFileDownloads"
          , "query"          A..= query_
          , "only_active"    A..= only_active_
          , "only_completed" A..= only_completed_
          , "offset"         A..= offset_
          , "limit"          A..= limit_
          ]

defaultSearchFileDownloads :: SearchFileDownloads
defaultSearchFileDownloads =
  SearchFileDownloads
    { query          = Nothing
    , only_active    = Nothing
    , only_completed = Nothing
    , offset         = Nothing
    , limit          = Nothing
    }

