module TD.Query.OptimizeStorage
  (OptimizeStorage(..)
  , defaultOptimizeStorage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FileType as FileType

-- | Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted. Returns 'TD.Data.StorageStatistics.StorageStatistics'
data OptimizeStorage
  = OptimizeStorage
    { size                           :: Maybe Int                 -- ^ Limit on the total size of files after deletion, in bytes. Pass -1 to use the default limit
    , ttl                            :: Maybe Int                 -- ^ Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
    , count                          :: Maybe Int                 -- ^ Limit on the total number of files after deletion. Pass -1 to use the default limit
    , immunity_delay                 :: Maybe Int                 -- ^ The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
    , file_types                     :: Maybe [FileType.FileType] -- ^ If non-empty, only files with the given types are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
    , chat_ids                       :: Maybe [Int]               -- ^ If non-empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
    , exclude_chat_ids               :: Maybe [Int]               -- ^ If non-empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
    , return_deleted_file_statistics :: Maybe Bool                -- ^ Pass true if statistics about the files that were deleted must be returned instead of the whole storage usage statistics. Affects only returned statistics
    , chat_limit                     :: Maybe Int                 -- ^ Same as in getStorageStatistics. Affects only returned statistics
    }
  deriving (Eq, Show)

instance I.ShortShow OptimizeStorage where
  shortShow
    OptimizeStorage
      { size                           = size_
      , ttl                            = ttl_
      , count                          = count_
      , immunity_delay                 = immunity_delay_
      , file_types                     = file_types_
      , chat_ids                       = chat_ids_
      , exclude_chat_ids               = exclude_chat_ids_
      , return_deleted_file_statistics = return_deleted_file_statistics_
      , chat_limit                     = chat_limit_
      }
        = "OptimizeStorage"
          ++ I.cc
          [ "size"                           `I.p` size_
          , "ttl"                            `I.p` ttl_
          , "count"                          `I.p` count_
          , "immunity_delay"                 `I.p` immunity_delay_
          , "file_types"                     `I.p` file_types_
          , "chat_ids"                       `I.p` chat_ids_
          , "exclude_chat_ids"               `I.p` exclude_chat_ids_
          , "return_deleted_file_statistics" `I.p` return_deleted_file_statistics_
          , "chat_limit"                     `I.p` chat_limit_
          ]

instance AT.ToJSON OptimizeStorage where
  toJSON
    OptimizeStorage
      { size                           = size_
      , ttl                            = ttl_
      , count                          = count_
      , immunity_delay                 = immunity_delay_
      , file_types                     = file_types_
      , chat_ids                       = chat_ids_
      , exclude_chat_ids               = exclude_chat_ids_
      , return_deleted_file_statistics = return_deleted_file_statistics_
      , chat_limit                     = chat_limit_
      }
        = A.object
          [ "@type"                          A..= AT.String "optimizeStorage"
          , "size"                           A..= size_
          , "ttl"                            A..= ttl_
          , "count"                          A..= count_
          , "immunity_delay"                 A..= immunity_delay_
          , "file_types"                     A..= file_types_
          , "chat_ids"                       A..= chat_ids_
          , "exclude_chat_ids"               A..= exclude_chat_ids_
          , "return_deleted_file_statistics" A..= return_deleted_file_statistics_
          , "chat_limit"                     A..= chat_limit_
          ]

defaultOptimizeStorage :: OptimizeStorage
defaultOptimizeStorage =
  OptimizeStorage
    { size                           = Nothing
    , ttl                            = Nothing
    , count                          = Nothing
    , immunity_delay                 = Nothing
    , file_types                     = Nothing
    , chat_ids                       = Nothing
    , exclude_chat_ids               = Nothing
    , return_deleted_file_statistics = Nothing
    , chat_limit                     = Nothing
    }

