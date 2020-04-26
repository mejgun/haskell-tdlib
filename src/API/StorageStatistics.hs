-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StorageStatisticsByChat as StorageStatisticsByChat

-- |
-- 
-- Contains the exact storage usage statistics split by chats and file type 
-- 
-- __size__ Total size of files
-- 
-- __count__ Total number of files
-- 
-- __by_chat__ Statistics split by chats
data StorageStatistics = 
 StorageStatistics { by_chat :: Maybe [StorageStatisticsByChat.StorageStatisticsByChat], count :: Maybe Int, size :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON StorageStatistics where
 toJSON (StorageStatistics { by_chat = by_chat, count = count, size = size }) =
  A.object [ "@type" A..= T.String "storageStatistics", "by_chat" A..= by_chat, "count" A..= count, "size" A..= size ]

instance T.FromJSON StorageStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "storageStatistics" -> parseStorageStatistics v
   _ -> mempty
  where
   parseStorageStatistics :: A.Value -> T.Parser StorageStatistics
   parseStorageStatistics = A.withObject "StorageStatistics" $ \o -> do
    by_chat <- o A..:? "by_chat"
    count <- mconcat [ o A..:? "count", readMaybe <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
    size <- mconcat [ o A..:? "size", readMaybe <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StorageStatistics { by_chat = by_chat, count = count, size = size }