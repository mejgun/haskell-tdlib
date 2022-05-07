{-# LANGUAGE OverloadedStrings #-}

module TD.Data.StorageStatisticsByFileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FileType as FileType
import qualified Utils as U

data StorageStatisticsByFileType = -- | Contains the storage usage statistics for a specific file type @file_type File type @size Total size of the files, in bytes @count Total number of files
  StorageStatisticsByFileType
  { -- |
    count :: Maybe Int,
    -- |
    size :: Maybe Int,
    -- |
    file_type :: Maybe FileType.FileType
  }
  deriving (Eq)

instance Show StorageStatisticsByFileType where
  show
    StorageStatisticsByFileType
      { count = count,
        size = size,
        file_type = file_type
      } =
      "StorageStatisticsByFileType"
        ++ U.cc
          [ U.p "count" count,
            U.p "size" size,
            U.p "file_type" file_type
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
        count_ <- mconcat [o A..:? "count", U.rm <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
        size_ <- mconcat [o A..:? "size", U.rm <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
        file_type_ <- o A..:? "file_type"
        return $ StorageStatisticsByFileType {count = count_, size = size_, file_type = file_type_}
  parseJSON _ = mempty

instance T.ToJSON StorageStatisticsByFileType where
  toJSON
    StorageStatisticsByFileType
      { count = count,
        size = size,
        file_type = file_type
      } =
      A.object
        [ "@type" A..= T.String "storageStatisticsByFileType",
          "count" A..= count,
          "size" A..= size,
          "file_type" A..= file_type
        ]
