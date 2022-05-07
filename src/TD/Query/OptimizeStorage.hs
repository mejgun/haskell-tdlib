{-# LANGUAGE OverloadedStrings #-}

module TD.Query.OptimizeStorage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.FileType as FileType
import qualified Utils as U

-- |
-- Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted
data OptimizeStorage = OptimizeStorage
  { -- | Same as in getStorageStatistics. Affects only returned statistics
    chat_limit :: Maybe Int,
    -- | Pass true if statistics about the files that were deleted must be returned instead of the whole storage usage statistics. Affects only returned statistics
    return_deleted_file_statistics :: Maybe Bool,
    -- | If non-empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
    exclude_chat_ids :: Maybe [Int],
    -- | If non-empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
    chat_ids :: Maybe [Int],
    -- | If non-empty, only files with the given types are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
    file_types :: Maybe [FileType.FileType],
    -- | The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
    immunity_delay :: Maybe Int,
    -- | Limit on the total number of files after deletion. Pass -1 to use the default limit
    count :: Maybe Int,
    -- | Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
    ttl :: Maybe Int,
    -- | Limit on the total size of files after deletion, in bytes. Pass -1 to use the default limit
    size :: Maybe Int
  }
  deriving (Eq)

instance Show OptimizeStorage where
  show
    OptimizeStorage
      { chat_limit = chat_limit,
        return_deleted_file_statistics = return_deleted_file_statistics,
        exclude_chat_ids = exclude_chat_ids,
        chat_ids = chat_ids,
        file_types = file_types,
        immunity_delay = immunity_delay,
        count = count,
        ttl = ttl,
        size = size
      } =
      "OptimizeStorage"
        ++ U.cc
          [ U.p "chat_limit" chat_limit,
            U.p "return_deleted_file_statistics" return_deleted_file_statistics,
            U.p "exclude_chat_ids" exclude_chat_ids,
            U.p "chat_ids" chat_ids,
            U.p "file_types" file_types,
            U.p "immunity_delay" immunity_delay,
            U.p "count" count,
            U.p "ttl" ttl,
            U.p "size" size
          ]

instance T.ToJSON OptimizeStorage where
  toJSON
    OptimizeStorage
      { chat_limit = chat_limit,
        return_deleted_file_statistics = return_deleted_file_statistics,
        exclude_chat_ids = exclude_chat_ids,
        chat_ids = chat_ids,
        file_types = file_types,
        immunity_delay = immunity_delay,
        count = count,
        ttl = ttl,
        size = size
      } =
      A.object
        [ "@type" A..= T.String "optimizeStorage",
          "chat_limit" A..= chat_limit,
          "return_deleted_file_statistics" A..= return_deleted_file_statistics,
          "exclude_chat_ids" A..= exclude_chat_ids,
          "chat_ids" A..= chat_ids,
          "file_types" A..= file_types,
          "immunity_delay" A..= immunity_delay,
          "count" A..= count,
          "ttl" A..= ttl,
          "size" A..= size
        ]
