-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsByChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StorageStatisticsByFileType as StorageStatisticsByFileType

--main = putStrLn "ok"

data StorageStatisticsByChat = 
 StorageStatisticsByChat { by_file_type :: [StorageStatisticsByFileType.StorageStatisticsByFileType], count :: Int, size :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON StorageStatisticsByChat where
 toJSON (StorageStatisticsByChat { by_file_type = by_file_type, count = count, size = size, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "storageStatisticsByChat", "by_file_type" A..= by_file_type, "count" A..= count, "size" A..= size, "chat_id" A..= chat_id ]
-- storageStatisticsByChat StorageStatisticsByChat  { by_file_type :: [StorageStatisticsByFileType.StorageStatisticsByFileType], count :: Int, size :: Int, chat_id :: Int } 

