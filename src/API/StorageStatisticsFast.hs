-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsFast where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data StorageStatisticsFast = 
 StorageStatisticsFast { log_size :: Maybe Int, language_pack_database_size :: Maybe Int, database_size :: Maybe Int, file_count :: Maybe Int, files_size :: Maybe Int }  deriving (Show)

instance T.ToJSON StorageStatisticsFast where
 toJSON (StorageStatisticsFast { log_size = log_size, language_pack_database_size = language_pack_database_size, database_size = database_size, file_count = file_count, files_size = files_size }) =
  A.object [ "@type" A..= T.String "storageStatisticsFast", "log_size" A..= log_size, "language_pack_database_size" A..= language_pack_database_size, "database_size" A..= database_size, "file_count" A..= file_count, "files_size" A..= files_size ]

instance T.FromJSON StorageStatisticsFast where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "storageStatisticsFast" -> parseStorageStatisticsFast v
   _ -> mempty
  where
   parseStorageStatisticsFast :: A.Value -> T.Parser StorageStatisticsFast
   parseStorageStatisticsFast = A.withObject "StorageStatisticsFast" $ \o -> do
    log_size <- optional $ o A..: "log_size"
    language_pack_database_size <- optional $ o A..: "language_pack_database_size"
    database_size <- optional $ o A..: "database_size"
    file_count <- optional $ o A..: "file_count"
    files_size <- optional $ o A..: "files_size"
    return $ StorageStatisticsFast { log_size = log_size, language_pack_database_size = language_pack_database_size, database_size = database_size, file_count = file_count, files_size = files_size }