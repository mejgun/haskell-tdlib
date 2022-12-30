{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StorageStatisticsByFileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FileType as FileType
import qualified Utils as U

-- |
data StorageStatisticsByFileType = -- | Contains the storage usage statistics for a specific file type
  StorageStatisticsByFileType
  { -- | Total number of files
    count :: Maybe Int,
    -- | Total size of the files, in bytes
    size :: Maybe Int,
    -- | File type
    file_type :: Maybe FileType.FileType
  }
  deriving (Eq)

instance Show StorageStatisticsByFileType where
  show
    StorageStatisticsByFileType
      { count = count_,
        size = size_,
        file_type = file_type_
      } =
      "StorageStatisticsByFileType"
        ++ U.cc
          [ U.p "count" count_,
            U.p "size" size_,
            U.p "file_type" file_type_
          ]

instance T.FromJSON StorageStatisticsByFileType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storageStatisticsByFileType" -> parseStorageStatisticsByFileType v
      _ -> mempty
    where
      parseStorageStatisticsByFileType :: A.Value -> T.Parser StorageStatisticsByFileType
      parseStorageStatisticsByFileType = A.withObject "StorageStatisticsByFileType" $ \o -> do
        count_ <- o A..:? "count"
        size_ <- o A..:? "size"
        file_type_ <- o A..:? "file_type"
        return $ StorageStatisticsByFileType {count = count_, size = size_, file_type = file_type_}
  parseJSON _ = mempty

instance T.ToJSON StorageStatisticsByFileType where
  toJSON
    StorageStatisticsByFileType
      { count = count_,
        size = size_,
        file_type = file_type_
      } =
      A.object
        [ "@type" A..= T.String "storageStatisticsByFileType",
          "count" A..= count_,
          "size" A..= size_,
          "file_type" A..= file_type_
        ]
