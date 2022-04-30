-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchFileDownloads where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Searches for files in the file download list or recently downloaded files from the list
-- 
-- __query__ Query to search for; may be empty to return all downloaded files
-- 
-- __only_active__ Pass true to search only for active downloads, including paused
-- 
-- __only_completed__ Pass true to search only for completed downloads
-- 
-- __offset__ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
-- 
-- __limit__ The maximum number of files to be returned
data SearchFileDownloads = 

 SearchFileDownloads { limit :: Maybe Int, offset :: Maybe String, only_completed :: Maybe Bool, only_active :: Maybe Bool, query :: Maybe String }  deriving (Eq)

instance Show SearchFileDownloads where
 show SearchFileDownloads { limit=limit, offset=offset, only_completed=only_completed, only_active=only_active, query=query } =
  "SearchFileDownloads" ++ U.cc [U.p "limit" limit, U.p "offset" offset, U.p "only_completed" only_completed, U.p "only_active" only_active, U.p "query" query ]

instance T.ToJSON SearchFileDownloads where
 toJSON SearchFileDownloads { limit = limit, offset = offset, only_completed = only_completed, only_active = only_active, query = query } =
  A.object [ "@type" A..= T.String "searchFileDownloads", "limit" A..= limit, "offset" A..= offset, "only_completed" A..= only_completed, "only_active" A..= only_active, "query" A..= query ]

instance T.FromJSON SearchFileDownloads where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchFileDownloads" -> parseSearchFileDownloads v
   _ -> mempty
  where
   parseSearchFileDownloads :: A.Value -> T.Parser SearchFileDownloads
   parseSearchFileDownloads = A.withObject "SearchFileDownloads" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- o A..:? "offset"
    only_completed <- o A..:? "only_completed"
    only_active <- o A..:? "only_active"
    query <- o A..:? "query"
    return $ SearchFileDownloads { limit = limit, offset = offset, only_completed = only_completed, only_active = only_active, query = query }
 parseJSON _ = mempty
