-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveAllFilesFromDownloads where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Removes all files from the file download list
-- 
-- __only_active__ Pass true to remove only active downloads, including paused
-- 
-- __only_completed__ Pass true to remove only completed downloads
-- 
-- __delete_from_cache__ Pass true to delete the file from the TDLib file cache
data RemoveAllFilesFromDownloads = 

 RemoveAllFilesFromDownloads { delete_from_cache :: Maybe Bool, only_completed :: Maybe Bool, only_active :: Maybe Bool }  deriving (Eq)

instance Show RemoveAllFilesFromDownloads where
 show RemoveAllFilesFromDownloads { delete_from_cache=delete_from_cache, only_completed=only_completed, only_active=only_active } =
  "RemoveAllFilesFromDownloads" ++ U.cc [U.p "delete_from_cache" delete_from_cache, U.p "only_completed" only_completed, U.p "only_active" only_active ]

instance T.ToJSON RemoveAllFilesFromDownloads where
 toJSON RemoveAllFilesFromDownloads { delete_from_cache = delete_from_cache, only_completed = only_completed, only_active = only_active } =
  A.object [ "@type" A..= T.String "removeAllFilesFromDownloads", "delete_from_cache" A..= delete_from_cache, "only_completed" A..= only_completed, "only_active" A..= only_active ]

instance T.FromJSON RemoveAllFilesFromDownloads where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeAllFilesFromDownloads" -> parseRemoveAllFilesFromDownloads v
   _ -> mempty
  where
   parseRemoveAllFilesFromDownloads :: A.Value -> T.Parser RemoveAllFilesFromDownloads
   parseRemoveAllFilesFromDownloads = A.withObject "RemoveAllFilesFromDownloads" $ \o -> do
    delete_from_cache <- o A..:? "delete_from_cache"
    only_completed <- o A..:? "only_completed"
    only_active <- o A..:? "only_active"
    return $ RemoveAllFilesFromDownloads { delete_from_cache = delete_from_cache, only_completed = only_completed, only_active = only_active }
 parseJSON _ = mempty
