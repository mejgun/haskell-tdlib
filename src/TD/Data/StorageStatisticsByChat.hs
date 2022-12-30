{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StorageStatisticsByChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StorageStatisticsByFileType as StorageStatisticsByFileType
import qualified Utils as U

-- |
data StorageStatisticsByChat = -- | Contains the storage usage statistics for a specific chat
  StorageStatisticsByChat
  { -- | Statistics split by file types
    by_file_type :: Maybe [StorageStatisticsByFileType.StorageStatisticsByFileType],
    -- | Total number of files in the chat
    count :: Maybe Int,
    -- | Total size of the files in the chat, in bytes
    size :: Maybe Int,
    -- | Chat identifier; 0 if none
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
        count_ <- o A..:? "count"
        size_ <- o A..:? "size"
        chat_id_ <- o A..:? "chat_id"
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
