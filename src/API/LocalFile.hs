-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LocalFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LocalFile = 
 LocalFile { downloaded_size :: Int, downloaded_prefix_size :: Int, download_offset :: Int, is_downloading_completed :: Bool, is_downloading_active :: Bool, can_be_deleted :: Bool, can_be_downloaded :: Bool, path :: String }  -- deriving (Show)

instance T.ToJSON LocalFile where
 toJSON (LocalFile { downloaded_size = downloaded_size, downloaded_prefix_size = downloaded_prefix_size, download_offset = download_offset, is_downloading_completed = is_downloading_completed, is_downloading_active = is_downloading_active, can_be_deleted = can_be_deleted, can_be_downloaded = can_be_downloaded, path = path }) =
  A.object [ "@type" A..= T.String "localFile", "downloaded_size" A..= downloaded_size, "downloaded_prefix_size" A..= downloaded_prefix_size, "download_offset" A..= download_offset, "is_downloading_completed" A..= is_downloading_completed, "is_downloading_active" A..= is_downloading_active, "can_be_deleted" A..= can_be_deleted, "can_be_downloaded" A..= can_be_downloaded, "path" A..= path ]
-- localFile LocalFile  { downloaded_size :: Int, downloaded_prefix_size :: Int, download_offset :: Int, is_downloading_completed :: Bool, is_downloading_active :: Bool, can_be_deleted :: Bool, can_be_downloaded :: Bool, path :: String } 

