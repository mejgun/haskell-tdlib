-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LocalFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents a local file
-- 
-- __path__ Local path to the locally available file part; may be empty
-- 
-- __can_be_downloaded__ True, if it is possible to try to download or generate the file
-- 
-- __can_be_deleted__ True, if the file can be deleted
-- 
-- __is_downloading_active__ True, if the file is currently being downloaded (or a local copy is being generated by some other means)
-- 
-- __is_downloading_completed__ True, if the local copy is fully available
-- 
-- __download_offset__ Download will be started from this offset. downloaded_prefix_size is calculated from this offset
-- 
-- __downloaded_prefix_size__ If is_downloading_completed is false, then only some prefix of the file starting from download_offset is ready to be read. downloaded_prefix_size is the size of that prefix
-- 
-- __downloaded_size__ Total downloaded file bytes. Should be used only for calculating download progress. The actual file size may be bigger, and some parts of it may contain garbage
data LocalFile = 

 LocalFile { downloaded_size :: Maybe Int, downloaded_prefix_size :: Maybe Int, download_offset :: Maybe Int, is_downloading_completed :: Maybe Bool, is_downloading_active :: Maybe Bool, can_be_deleted :: Maybe Bool, can_be_downloaded :: Maybe Bool, path :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON LocalFile where
 toJSON (LocalFile { downloaded_size = downloaded_size, downloaded_prefix_size = downloaded_prefix_size, download_offset = download_offset, is_downloading_completed = is_downloading_completed, is_downloading_active = is_downloading_active, can_be_deleted = can_be_deleted, can_be_downloaded = can_be_downloaded, path = path }) =
  A.object [ "@type" A..= T.String "localFile", "downloaded_size" A..= downloaded_size, "downloaded_prefix_size" A..= downloaded_prefix_size, "download_offset" A..= download_offset, "is_downloading_completed" A..= is_downloading_completed, "is_downloading_active" A..= is_downloading_active, "can_be_deleted" A..= can_be_deleted, "can_be_downloaded" A..= can_be_downloaded, "path" A..= path ]

instance T.FromJSON LocalFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "localFile" -> parseLocalFile v
   _ -> mempty
  where
   parseLocalFile :: A.Value -> T.Parser LocalFile
   parseLocalFile = A.withObject "LocalFile" $ \o -> do
    downloaded_size <- mconcat [ o A..:? "downloaded_size", readMaybe <$> (o A..: "downloaded_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    downloaded_prefix_size <- mconcat [ o A..:? "downloaded_prefix_size", readMaybe <$> (o A..: "downloaded_prefix_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    download_offset <- mconcat [ o A..:? "download_offset", readMaybe <$> (o A..: "download_offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_downloading_completed <- o A..:? "is_downloading_completed"
    is_downloading_active <- o A..:? "is_downloading_active"
    can_be_deleted <- o A..:? "can_be_deleted"
    can_be_downloaded <- o A..:? "can_be_downloaded"
    path <- o A..:? "path"
    return $ LocalFile { downloaded_size = downloaded_size, downloaded_prefix_size = downloaded_prefix_size, download_offset = download_offset, is_downloading_completed = is_downloading_completed, is_downloading_active = is_downloading_active, can_be_deleted = can_be_deleted, can_be_downloaded = can_be_downloaded, path = path }