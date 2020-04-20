-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRemoteFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

--main = putStrLn "ok"

data GetRemoteFile = 
 GetRemoteFile { file_type :: FileType.FileType, remote_file_id :: String }  -- deriving (Show)

instance T.ToJSON GetRemoteFile where
 toJSON (GetRemoteFile { file_type = file_type, remote_file_id = remote_file_id }) =
  A.object [ "@type" A..= T.String "getRemoteFile", "file_type" A..= file_type, "remote_file_id" A..= remote_file_id ]
-- getRemoteFile GetRemoteFile  { file_type :: FileType.FileType, remote_file_id :: String } 

