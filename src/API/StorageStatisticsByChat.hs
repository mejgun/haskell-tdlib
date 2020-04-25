-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsByChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StorageStatisticsByFileType as StorageStatisticsByFileType

data StorageStatisticsByChat = 
 StorageStatisticsByChat { by_file_type :: Maybe [StorageStatisticsByFileType.StorageStatisticsByFileType], count :: Maybe Int, size :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    by_file_type <- o A..:? "by_file_type"
    count <- mconcat [ o A..:? "count", readMaybe <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
    size <- mconcat [ o A..:? "size", readMaybe <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StorageStatisticsByChat { by_file_type = by_file_type, count = count, size = size, chat_id = chat_id }