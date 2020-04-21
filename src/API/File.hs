-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.File where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.RemoteFile as RemoteFile
import {-# SOURCE #-} qualified API.LocalFile as LocalFile

data File = 
 File { remote :: RemoteFile.RemoteFile, local :: LocalFile.LocalFile, expected_size :: Int, size :: Int, _id :: Int }  deriving (Show)

instance T.ToJSON File where
 toJSON (File { remote = remote, local = local, expected_size = expected_size, size = size, _id = _id }) =
  A.object [ "@type" A..= T.String "file", "remote" A..= remote, "local" A..= local, "expected_size" A..= expected_size, "size" A..= size, "id" A..= _id ]

instance T.FromJSON File where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "file" -> parseFile v
   _ -> mempty
  where
   parseFile :: A.Value -> T.Parser File
   parseFile = A.withObject "File" $ \o -> do
    remote <- o A..: "remote"
    local <- o A..: "local"
    expected_size <- o A..: "expected_size"
    size <- o A..: "size"
    _id <- o A..: "id"
    return $ File { remote = remote, local = local, expected_size = expected_size, size = size, _id = _id }