-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsFast where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data StorageStatisticsFast = 
 StorageStatisticsFast { log_size :: Int, language_pack_database_size :: Int, database_size :: Int, file_count :: Int, files_size :: Int }  -- deriving (Show)

instance T.ToJSON StorageStatisticsFast where
 toJSON (StorageStatisticsFast { log_size = log_size, language_pack_database_size = language_pack_database_size, database_size = database_size, file_count = file_count, files_size = files_size }) =
  A.object [ "@type" A..= T.String "storageStatisticsFast", "log_size" A..= log_size, "language_pack_database_size" A..= language_pack_database_size, "database_size" A..= database_size, "file_count" A..= file_count, "files_size" A..= files_size ]
-- storageStatisticsFast StorageStatisticsFast  { log_size :: Int, language_pack_database_size :: Int, database_size :: Int, file_count :: Int, files_size :: Int } 



instance T.FromJSON StorageStatisticsFast where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "storageStatisticsFast" -> parseStorageStatisticsFast v
  where
   parseStorageStatisticsFast :: A.Value -> T.Parser StorageStatisticsFast
   parseStorageStatisticsFast = A.withObject "StorageStatisticsFast" $ \o -> do
    log_size <- o A..: "log_size"
    language_pack_database_size <- o A..: "language_pack_database_size"
    database_size <- o A..: "database_size"
    file_count <- o A..: "file_count"
    files_size <- o A..: "files_size"
    return $ StorageStatisticsFast { log_size = log_size, language_pack_database_size = language_pack_database_size, database_size = database_size, file_count = file_count, files_size = files_size }