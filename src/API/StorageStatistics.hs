-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StorageStatisticsByChat as StorageStatisticsByChat

data StorageStatistics = 
 StorageStatistics { by_chat :: [StorageStatisticsByChat.StorageStatisticsByChat], count :: Int, size :: Int }  deriving (Show)

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
    by_chat <- o A..: "by_chat"
    count <- o A..: "count"
    size <- o A..: "size"
    return $ StorageStatistics { by_chat = by_chat, count = count, size = size }