-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FoundFileDownloads where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.FileDownload as FileDownload
import {-# SOURCE #-} qualified API.DownloadedFileCounts as DownloadedFileCounts

-- |
-- 
-- Contains a list of downloaded files, found by a search
-- 
-- __total_counts__ Total number of suitable files, ignoring offset
-- 
-- __files__ The list of files
-- 
-- __next_offset__ The offset for the next request. If empty, there are no more results
data FoundFileDownloads = 

 FoundFileDownloads { next_offset :: Maybe String, files :: Maybe [FileDownload.FileDownload], total_counts :: Maybe DownloadedFileCounts.DownloadedFileCounts }  deriving (Eq)

instance Show FoundFileDownloads where
 show FoundFileDownloads { next_offset=next_offset, files=files, total_counts=total_counts } =
  "FoundFileDownloads" ++ U.cc [U.p "next_offset" next_offset, U.p "files" files, U.p "total_counts" total_counts ]

instance T.ToJSON FoundFileDownloads where
 toJSON FoundFileDownloads { next_offset = next_offset, files = files, total_counts = total_counts } =
  A.object [ "@type" A..= T.String "foundFileDownloads", "next_offset" A..= next_offset, "files" A..= files, "total_counts" A..= total_counts ]

instance T.FromJSON FoundFileDownloads where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "foundFileDownloads" -> parseFoundFileDownloads v
   _ -> mempty
  where
   parseFoundFileDownloads :: A.Value -> T.Parser FoundFileDownloads
   parseFoundFileDownloads = A.withObject "FoundFileDownloads" $ \o -> do
    next_offset <- o A..:? "next_offset"
    files <- o A..:? "files"
    total_counts <- o A..:? "total_counts"
    return $ FoundFileDownloads { next_offset = next_offset, files = files, total_counts = total_counts }
 parseJSON _ = mempty
