-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsFast where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains approximate storage usage statistics, excluding files of unknown file type 
-- 
-- __files_size__ Approximate total size of files, in bytes
-- 
-- __file_count__ Approximate number of files
-- 
-- __database_size__ Size of the database
-- 
-- __language_pack_database_size__ Size of the language pack database
-- 
-- __log_size__ Size of the TDLib internal log
data StorageStatisticsFast = 

 StorageStatisticsFast { log_size :: Maybe Int, language_pack_database_size :: Maybe Int, database_size :: Maybe Int, file_count :: Maybe Int, files_size :: Maybe Int }  deriving (Eq)

instance Show StorageStatisticsFast where
 show StorageStatisticsFast { log_size=log_size, language_pack_database_size=language_pack_database_size, database_size=database_size, file_count=file_count, files_size=files_size } =
  "StorageStatisticsFast" ++ U.cc [U.p "log_size" log_size, U.p "language_pack_database_size" language_pack_database_size, U.p "database_size" database_size, U.p "file_count" file_count, U.p "files_size" files_size ]

instance T.ToJSON StorageStatisticsFast where
 toJSON StorageStatisticsFast { log_size = log_size, language_pack_database_size = language_pack_database_size, database_size = database_size, file_count = file_count, files_size = files_size } =
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
    log_size <- mconcat [ o A..:? "log_size", readMaybe <$> (o A..: "log_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    language_pack_database_size <- mconcat [ o A..:? "language_pack_database_size", readMaybe <$> (o A..: "language_pack_database_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    database_size <- mconcat [ o A..:? "database_size", readMaybe <$> (o A..: "database_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    file_count <- mconcat [ o A..:? "file_count", readMaybe <$> (o A..: "file_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    files_size <- mconcat [ o A..:? "files_size", readMaybe <$> (o A..: "files_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StorageStatisticsFast { log_size = log_size, language_pack_database_size = language_pack_database_size, database_size = database_size, file_count = file_count, files_size = files_size }
 parseJSON _ = mempty
