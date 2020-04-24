-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OptimizeStorage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

data OptimizeStorage = 
 OptimizeStorage { chat_limit :: Maybe Int, return_deleted_file_statistics :: Maybe Bool, exclude_chat_ids :: Maybe [Int], chat_ids :: Maybe [Int], file_types :: Maybe [FileType.FileType], immunity_delay :: Maybe Int, count :: Maybe Int, ttl :: Maybe Int, size :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON OptimizeStorage where
 toJSON (OptimizeStorage { chat_limit = chat_limit, return_deleted_file_statistics = return_deleted_file_statistics, exclude_chat_ids = exclude_chat_ids, chat_ids = chat_ids, file_types = file_types, immunity_delay = immunity_delay, count = count, ttl = ttl, size = size }) =
  A.object [ "@type" A..= T.String "optimizeStorage", "chat_limit" A..= chat_limit, "return_deleted_file_statistics" A..= return_deleted_file_statistics, "exclude_chat_ids" A..= exclude_chat_ids, "chat_ids" A..= chat_ids, "file_types" A..= file_types, "immunity_delay" A..= immunity_delay, "count" A..= count, "ttl" A..= ttl, "size" A..= size ]

instance T.FromJSON OptimizeStorage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "optimizeStorage" -> parseOptimizeStorage v
   _ -> mempty
  where
   parseOptimizeStorage :: A.Value -> T.Parser OptimizeStorage
   parseOptimizeStorage = A.withObject "OptimizeStorage" $ \o -> do
    chat_limit <- optional $ o A..: "chat_limit"
    return_deleted_file_statistics <- optional $ o A..: "return_deleted_file_statistics"
    exclude_chat_ids <- optional $ o A..: "exclude_chat_ids"
    chat_ids <- optional $ o A..: "chat_ids"
    file_types <- optional $ o A..: "file_types"
    immunity_delay <- optional $ o A..: "immunity_delay"
    count <- optional $ o A..: "count"
    ttl <- optional $ o A..: "ttl"
    size <- optional $ o A..: "size"
    return $ OptimizeStorage { chat_limit = chat_limit, return_deleted_file_statistics = return_deleted_file_statistics, exclude_chat_ids = exclude_chat_ids, chat_ids = chat_ids, file_types = file_types, immunity_delay = immunity_delay, count = count, ttl = ttl, size = size }