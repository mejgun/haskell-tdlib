-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OptimizeStorage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

--main = putStrLn "ok"

data OptimizeStorage = 
 OptimizeStorage { chat_limit :: Int, return_deleted_file_statistics :: Bool, exclude_chat_ids :: [Int], chat_ids :: [Int], file_types :: [FileType.FileType], immunity_delay :: Int, count :: Int, ttl :: Int, size :: Int }  -- deriving (Show)

instance T.ToJSON OptimizeStorage where
 toJSON (OptimizeStorage { chat_limit = chat_limit, return_deleted_file_statistics = return_deleted_file_statistics, exclude_chat_ids = exclude_chat_ids, chat_ids = chat_ids, file_types = file_types, immunity_delay = immunity_delay, count = count, ttl = ttl, size = size }) =
  A.object [ "@type" A..= T.String "optimizeStorage", "chat_limit" A..= chat_limit, "return_deleted_file_statistics" A..= return_deleted_file_statistics, "exclude_chat_ids" A..= exclude_chat_ids, "chat_ids" A..= chat_ids, "file_types" A..= file_types, "immunity_delay" A..= immunity_delay, "count" A..= count, "ttl" A..= ttl, "size" A..= size ]
-- optimizeStorage OptimizeStorage  { chat_limit :: Int, return_deleted_file_statistics :: Bool, exclude_chat_ids :: [Int], chat_ids :: [Int], file_types :: [FileType.FileType], immunity_delay :: Int, count :: Int, ttl :: Int, size :: Int } 



instance T.FromJSON OptimizeStorage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "optimizeStorage" -> parseOptimizeStorage v
  where
   parseOptimizeStorage :: A.Value -> T.Parser OptimizeStorage
   parseOptimizeStorage = A.withObject "OptimizeStorage" $ \o -> do
    chat_limit <- o A..: "chat_limit"
    return_deleted_file_statistics <- o A..: "return_deleted_file_statistics"
    exclude_chat_ids <- o A..: "exclude_chat_ids"
    chat_ids <- o A..: "chat_ids"
    file_types <- o A..: "file_types"
    immunity_delay <- o A..: "immunity_delay"
    count <- o A..: "count"
    ttl <- o A..: "ttl"
    size <- o A..: "size"
    return $ OptimizeStorage { chat_limit = chat_limit, return_deleted_file_statistics = return_deleted_file_statistics, exclude_chat_ids = exclude_chat_ids, chat_ids = chat_ids, file_types = file_types, immunity_delay = immunity_delay, count = count, ttl = ttl, size = size }