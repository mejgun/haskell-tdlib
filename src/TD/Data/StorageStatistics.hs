{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StorageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StorageStatisticsByChat as StorageStatisticsByChat
import qualified Utils as U

-- |
data StorageStatistics = -- | Contains the exact storage usage statistics split by chats and file type
  StorageStatistics
  { -- | Statistics split by chats
    by_chat :: Maybe [StorageStatisticsByChat.StorageStatisticsByChat],
    -- | Total number of files
    count :: Maybe Int,
    -- | Total size of files, in bytes
    size :: Maybe Int
  }
  deriving (Eq)

instance Show StorageStatistics where
  show
    StorageStatistics
      { by_chat = by_chat_,
        count = count_,
        size = size_
      } =
      "StorageStatistics"
        ++ U.cc
          [ U.p "by_chat" by_chat_,
            U.p "count" count_,
            U.p "size" size_
          ]

instance T.FromJSON StorageStatistics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storageStatistics" -> parseStorageStatistics v
      _ -> mempty
    where
      parseStorageStatistics :: A.Value -> T.Parser StorageStatistics
      parseStorageStatistics = A.withObject "StorageStatistics" $ \o -> do
        by_chat_ <- o A..:? "by_chat"
        count_ <- o A..:? "count"
        size_ <- o A..:? "size"
        return $ StorageStatistics {by_chat = by_chat_, count = count_, size = size_}
  parseJSON _ = mempty

instance T.ToJSON StorageStatistics where
  toJSON
    StorageStatistics
      { by_chat = by_chat_,
        count = count_,
        size = size_
      } =
      A.object
        [ "@type" A..= T.String "storageStatistics",
          "by_chat" A..= by_chat_,
          "count" A..= count_,
          "size" A..= size_
        ]
