-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StorageStatisticsByChat as StorageStatisticsByChat

--main = putStrLn "ok"

data StorageStatistics = 
 StorageStatistics { by_chat :: [StorageStatisticsByChat.StorageStatisticsByChat], count :: Int, size :: Int }  -- deriving (Show)

instance T.ToJSON StorageStatistics where
 toJSON (StorageStatistics { by_chat = by_chat, count = count, size = size }) =
  A.object [ "@type" A..= T.String "storageStatistics", "by_chat" A..= by_chat, "count" A..= count, "size" A..= size ]
-- storageStatistics StorageStatistics  { by_chat :: [StorageStatisticsByChat.StorageStatisticsByChat], count :: Int, size :: Int } 

