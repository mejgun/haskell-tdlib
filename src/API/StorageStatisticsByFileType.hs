-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StorageStatisticsByFileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

--main = putStrLn "ok"

data StorageStatisticsByFileType = 
 StorageStatisticsByFileType { count :: Int, size :: Int, file_type :: FileType.FileType }  -- deriving (Show)

instance T.ToJSON StorageStatisticsByFileType where
 toJSON (StorageStatisticsByFileType { count = count, size = size, file_type = file_type }) =
  A.object [ "@type" A..= T.String "storageStatisticsByFileType", "count" A..= count, "size" A..= size, "file_type" A..= file_type ]
-- storageStatisticsByFileType StorageStatisticsByFileType  { count :: Int, size :: Int, file_type :: FileType.FileType } 

