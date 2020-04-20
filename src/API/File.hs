-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.File where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.RemoteFile as RemoteFile
import {-# SOURCE #-} qualified API.LocalFile as LocalFile

--main = putStrLn "ok"

data File = 
 File { remote :: RemoteFile.RemoteFile, local :: LocalFile.LocalFile, expected_size :: Int, size :: Int, _id :: Int }  -- deriving (Show)

instance T.ToJSON File where
 toJSON (File { remote = remote, local = local, expected_size = expected_size, size = size, _id = _id }) =
  A.object [ "@type" A..= T.String "file", "remote" A..= remote, "local" A..= local, "expected_size" A..= expected_size, "size" A..= size, "id" A..= _id ]
-- file File  { remote :: RemoteFile.RemoteFile, local :: LocalFile.LocalFile, expected_size :: Int, size :: Int, _id :: Int } 

