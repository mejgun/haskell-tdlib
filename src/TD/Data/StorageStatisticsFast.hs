module TD.Data.StorageStatisticsFast
  (StorageStatisticsFast(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StorageStatisticsFast
  = StorageStatisticsFast -- ^ Contains approximate storage usage statistics, excluding files of unknown file type
    { files_size                  :: Maybe Int -- ^ Approximate total size of files, in bytes
    , file_count                  :: Maybe Int -- ^ Approximate number of files
    , database_size               :: Maybe Int -- ^ Size of the database
    , language_pack_database_size :: Maybe Int -- ^ Size of the language pack database
    , log_size                    :: Maybe Int -- ^ Size of the TDLib internal log
    }
  deriving (Eq, Show)

instance I.ShortShow StorageStatisticsFast where
  shortShow StorageStatisticsFast
    { files_size                  = files_size_
    , file_count                  = file_count_
    , database_size               = database_size_
    , language_pack_database_size = language_pack_database_size_
    , log_size                    = log_size_
    }
      = "StorageStatisticsFast"
        ++ I.cc
        [ "files_size"                  `I.p` files_size_
        , "file_count"                  `I.p` file_count_
        , "database_size"               `I.p` database_size_
        , "language_pack_database_size" `I.p` language_pack_database_size_
        , "log_size"                    `I.p` log_size_
        ]

instance AT.FromJSON StorageStatisticsFast where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storageStatisticsFast" -> parseStorageStatisticsFast v
      _                       -> mempty
    
    where
      parseStorageStatisticsFast :: A.Value -> AT.Parser StorageStatisticsFast
      parseStorageStatisticsFast = A.withObject "StorageStatisticsFast" $ \o -> do
        files_size_                  <- o A..:?  "files_size"
        file_count_                  <- o A..:?  "file_count"
        database_size_               <- o A..:?  "database_size"
        language_pack_database_size_ <- o A..:?  "language_pack_database_size"
        log_size_                    <- o A..:?  "log_size"
        pure $ StorageStatisticsFast
          { files_size                  = files_size_
          , file_count                  = file_count_
          , database_size               = database_size_
          , language_pack_database_size = language_pack_database_size_
          , log_size                    = log_size_
          }
  parseJSON _ = mempty

