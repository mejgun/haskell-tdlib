-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsByFileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

data StorageStatisticsByFileType = 
 StorageStatisticsByFileType { count :: Int, size :: Int, file_type :: FileType.FileType }  deriving (Show)

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
    count <- o A..: "count"
    size <- o A..: "size"
    file_type <- o A..: "file_type"
    return $ StorageStatisticsByFileType { count = count, size = size, file_type = file_type }