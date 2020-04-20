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

