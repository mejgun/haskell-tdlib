-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DownloadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DownloadFile = 
 DownloadFile { synchronous :: Bool, limit :: Int, offset :: Int, priority :: Int, file_id :: Int }  -- deriving (Show)

instance T.ToJSON DownloadFile where
 toJSON (DownloadFile { synchronous = synchronous, limit = limit, offset = offset, priority = priority, file_id = file_id }) =
  A.object [ "@type" A..= T.String "downloadFile", "synchronous" A..= synchronous, "limit" A..= limit, "offset" A..= offset, "priority" A..= priority, "file_id" A..= file_id ]
-- downloadFile DownloadFile  { synchronous :: Bool, limit :: Int, offset :: Int, priority :: Int, file_id :: Int } 

