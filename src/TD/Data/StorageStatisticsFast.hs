{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StorageStatisticsFast where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data StorageStatisticsFast = -- | Contains approximate storage usage statistics, excluding files of unknown file type @files_size Approximate total size of files, in bytes @file_count Approximate number of files
  StorageStatisticsFast
  { -- |
    log_size :: Maybe Int,
    -- |
    language_pack_database_size :: Maybe Int,
    -- | Size of the database @language_pack_database_size Size of the language pack database @log_size Size of the TDLib internal log
    database_size :: Maybe Int,
    -- |
    file_count :: Maybe Int,
    -- |
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
        log_size_ <- mconcat [o A..:? "log_size", U.rm <$> (o A..: "log_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        language_pack_database_size_ <- mconcat [o A..:? "language_pack_database_size", U.rm <$> (o A..: "language_pack_database_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        database_size_ <- mconcat [o A..:? "database_size", U.rm <$> (o A..: "database_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        file_count_ <- mconcat [o A..:? "file_count", U.rm <$> (o A..: "file_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        files_size_ <- mconcat [o A..:? "files_size", U.rm <$> (o A..: "files_size" :: T.Parser String)] :: T.Parser (Maybe Int)
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
