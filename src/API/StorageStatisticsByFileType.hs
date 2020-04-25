-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsByFileType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

data StorageStatisticsByFileType = 
 StorageStatisticsByFileType { count :: Maybe Int, size :: Maybe Int, file_type :: Maybe FileType.FileType }  deriving (Show, Eq)

instance T.ToJSON StorageStatisticsByFileType where
 toJSON (StorageStatisticsByFileType { count = count, size = size, file_type = file_type }) =
  A.object [ "@type" A..= T.String "storageStatisticsByFileType", "count" A..= count, "size" A..= size, "file_type" A..= file_type ]

instance T.FromJSON StorageStatisticsByFileType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "storageStatisticsByFileType" -> parseStorageStatisticsByFileType v
   _ -> mempty
  where
   parseStorageStatisticsByFileType :: A.Value -> T.Parser StorageStatisticsByFileType
   parseStorageStatisticsByFileType = A.withObject "StorageStatisticsByFileType" $ \o -> do
    count <- mconcat [ o A..:? "count", readMaybe <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
    size <- mconcat [ o A..:? "size", readMaybe <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
    file_type <- o A..:? "file_type"
    return $ StorageStatisticsByFileType { count = count, size = size, file_type = file_type }