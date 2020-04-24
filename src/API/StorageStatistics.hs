-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatistics where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StorageStatisticsByChat as StorageStatisticsByChat

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
    by_chat <- optional $ o A..: "by_chat"
    count <- optional $ o A..: "count"
    size <- optional $ o A..: "size"
    return $ StorageStatistics { by_chat = by_chat, count = count, size = size }