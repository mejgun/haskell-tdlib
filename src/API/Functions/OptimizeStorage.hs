-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OptimizeStorage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

-- |
-- 
-- Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted
-- 
-- __size__ Limit on the total size of files after deletion. Pass -1 to use the default limit
-- 
-- __ttl__ Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
-- 
-- __count__ Limit on the total count of files after deletion. Pass -1 to use the default limit
-- 
-- __immunity_delay__ The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
-- 
-- __file_types__ If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
-- 
-- __chat_ids__ If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
-- 
-- __exclude_chat_ids__ If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
-- 
-- __return_deleted_file_statistics__ Pass true if deleted file statistics needs to be returned instead of the whole storage usage statistics. Affects only returned statistics
-- 
-- __chat_limit__ Same as in getStorageStatistics. Affects only returned statistics
data OptimizeStorage = 
 OptimizeStorage { chat_limit :: Maybe Int, return_deleted_file_statistics :: Maybe Bool, exclude_chat_ids :: Maybe [Int], chat_ids :: Maybe [Int], file_types :: Maybe [FileType.FileType], immunity_delay :: Maybe Int, count :: Maybe Int, ttl :: Maybe Int, size :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON OptimizeStorage where
 toJSON (OptimizeStorage { chat_limit = chat_limit, return_deleted_file_statistics = return_deleted_file_statistics, exclude_chat_ids = exclude_chat_ids, chat_ids = chat_ids, file_types = file_types, immunity_delay = immunity_delay, count = count, ttl = ttl, size = size }) =
  A.object [ "@type" A..= T.String "optimizeStorage", "chat_limit" A..= chat_limit, "return_deleted_file_statistics" A..= return_deleted_file_statistics, "exclude_chat_ids" A..= exclude_chat_ids, "chat_ids" A..= chat_ids, "file_types" A..= file_types, "immunity_delay" A..= immunity_delay, "count" A..= count, "ttl" A..= ttl, "size" A..= size ]

instance T.FromJSON OptimizeStorage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "optimizeStorage" -> parseOptimizeStorage v
   _ -> mempty
  where
   parseOptimizeStorage :: A.Value -> T.Parser OptimizeStorage
   parseOptimizeStorage = A.withObject "OptimizeStorage" $ \o -> do
    chat_limit <- mconcat [ o A..:? "chat_limit", readMaybe <$> (o A..: "chat_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    return_deleted_file_statistics <- o A..:? "return_deleted_file_statistics"
    exclude_chat_ids <- o A..:? "exclude_chat_ids"
    chat_ids <- o A..:? "chat_ids"
    file_types <- o A..:? "file_types"
    immunity_delay <- mconcat [ o A..:? "immunity_delay", readMaybe <$> (o A..: "immunity_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    count <- mconcat [ o A..:? "count", readMaybe <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    size <- mconcat [ o A..:? "size", readMaybe <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ OptimizeStorage { chat_limit = chat_limit, return_deleted_file_statistics = return_deleted_file_statistics, exclude_chat_ids = exclude_chat_ids, chat_ids = chat_ids, file_types = file_types, immunity_delay = immunity_delay, count = count, ttl = ttl, size = size }