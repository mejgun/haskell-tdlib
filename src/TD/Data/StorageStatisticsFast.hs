{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StorageStatisticsFast where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data StorageStatisticsFast = -- | Contains approximate storage usage statistics, excluding files of unknown file type
  StorageStatisticsFast
  { -- | Size of the TDLib internal log
    log_size :: Maybe Int,
    -- | Size of the language pack database
    language_pack_database_size :: Maybe Int,
    -- | Size of the database
    database_size :: Maybe Int,
    -- | Approximate number of files
    file_count :: Maybe Int,
    -- | Approximate total size of files, in bytes
    files_size :: Maybe Int
  }
  deriving (Eq)

instance Show StorageStatisticsFast where
  show
    StorageStatisticsFast
      { log_size = log_size_,
        language_pack_database_size = language_pack_database_size_,
        database_size = database_size_,
        file_count = file_count_,
        files_size = files_size_
      } =
      "StorageStatisticsFast"
        ++ U.cc
          [ U.p "log_size" log_size_,
            U.p "language_pack_database_size" language_pack_database_size_,
            U.p "database_size" database_size_,
            U.p "file_count" file_count_,
            U.p "files_size" files_size_
          ]

instance T.FromJSON StorageStatisticsFast where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storageStatisticsFast" -> parseStorageStatisticsFast v
      _ -> mempty
    where
      parseStorageStatisticsFast :: A.Value -> T.Parser StorageStatisticsFast
      parseStorageStatisticsFast = A.withObject "StorageStatisticsFast" $ \o -> do
        log_size_ <- o A..:? "log_size"
        language_pack_database_size_ <- o A..:? "language_pack_database_size"
        database_size_ <- o A..:? "database_size"
        file_count_ <- o A..:? "file_count"
        files_size_ <- o A..:? "files_size"
        return $ StorageStatisticsFast {log_size = log_size_, language_pack_database_size = language_pack_database_size_, database_size = database_size_, file_count = file_count_, files_size = files_size_}
  parseJSON _ = mempty

instance T.ToJSON StorageStatisticsFast where
  toJSON
    StorageStatisticsFast
      { log_size = log_size_,
        language_pack_database_size = language_pack_database_size_,
        database_size = database_size_,
        file_count = file_count_,
        files_size = files_size_
      } =
      A.object
        [ "@type" A..= T.String "storageStatisticsFast",
          "log_size" A..= log_size_,
          "language_pack_database_size" A..= language_pack_database_size_,
          "database_size" A..= database_size_,
          "file_count" A..= file_count_,
          "files_size" A..= files_size_
        ]
