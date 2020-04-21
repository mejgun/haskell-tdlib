-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsByChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StorageStatisticsByFileType as StorageStatisticsByFileType

data StorageStatisticsByChat = 
 StorageStatisticsByChat { by_file_type :: [StorageStatisticsByFileType.StorageStatisticsByFileType], count :: Int, size :: Int, chat_id :: Int }  deriving (Show)

instance T.ToJSON StorageStatisticsByChat where
 toJSON (StorageStatisticsByChat { by_file_type = by_file_type, count = count, size = size, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "storageStatisticsByChat", "by_file_type" A..= by_file_type, "count" A..= count, "size" A..= size, "chat_id" A..= chat_id ]

instance T.FromJSON StorageStatisticsByChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "storageStatisticsByChat" -> parseStorageStatisticsByChat v
   _ -> mempty
  where
   parseStorageStatisticsByChat :: A.Value -> T.Parser StorageStatisticsByChat
   parseStorageStatisticsByChat = A.withObject "StorageStatisticsByChat" $ \o -> do
    by_file_type <- o A..: "by_file_type"
    count <- o A..: "count"
    size <- o A..: "size"
    chat_id <- o A..: "chat_id"
    return $ StorageStatisticsByChat { by_file_type = by_file_type, count = count, size = size, chat_id = chat_id }