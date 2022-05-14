{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StorageStatisticsByChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StorageStatisticsByFileType as StorageStatisticsByFileType
import qualified Utils as U

-- |
data StorageStatisticsByChat = -- | Contains the storage usage statistics for a specific chat @chat_id Chat identifier; 0 if none @size Total size of the files in the chat, in bytes @count Total number of files in the chat @by_file_type Statistics split by file types
  StorageStatisticsByChat
  { -- |
    by_file_type :: Maybe [StorageStatisticsByFileType.StorageStatisticsByFileType],
    -- |
    count :: Maybe Int,
    -- |
    size :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show StorageStatisticsByChat where
  show
    StorageStatisticsByChat
      { by_file_type = by_file_type_,
        count = count_,
        size = size_,
        chat_id = chat_id_
      } =
      "StorageStatisticsByChat"
        ++ U.cc
          [ U.p "by_file_type" by_file_type_,
            U.p "count" count_,
            U.p "size" size_,
            U.p "chat_id" chat_id_
          ]

instance T.FromJSON StorageStatisticsByChat where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storageStatisticsByChat" -> parseStorageStatisticsByChat v
      _ -> mempty
    where
      parseStorageStatisticsByChat :: A.Value -> T.Parser StorageStatisticsByChat
      parseStorageStatisticsByChat = A.withObject "StorageStatisticsByChat" $ \o -> do
        by_file_type_ <- o A..:? "by_file_type"
        count_ <- mconcat [o A..:? "count", U.rm <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
        size_ <- mconcat [o A..:? "size", U.rm <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ StorageStatisticsByChat {by_file_type = by_file_type_, count = count_, size = size_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON StorageStatisticsByChat where
  toJSON
    StorageStatisticsByChat
      { by_file_type = by_file_type_,
        count = count_,
        size = size_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "storageStatisticsByChat",
          "by_file_type" A..= by_file_type_,
          "count" A..= count_,
          "size" A..= size_,
          "chat_id" A..= chat_id_
        ]
