-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.File where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.RemoteFile as RemoteFile
import {-# SOURCE #-} qualified API.LocalFile as LocalFile

-- |
-- 
-- Represents a file
-- 
-- __id__ Unique file identifier
-- 
-- __size__ File size; 0 if unknown
-- 
-- __expected_size__ Expected file size in case the exact file size is unknown, but an approximate size is known. Can be used to show download/upload progress
-- 
-- __local__ Information about the local copy of the file
-- 
-- __remote__ Information about the remote copy of the file
data File = 
 File { remote :: Maybe RemoteFile.RemoteFile, local :: Maybe LocalFile.LocalFile, expected_size :: Maybe Int, size :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

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
    remote <- o A..:? "remote"
    local <- o A..:? "local"
    expected_size <- mconcat [ o A..:? "expected_size", readMaybe <$> (o A..: "expected_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    size <- mconcat [ o A..:? "size", readMaybe <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ File { remote = remote, local = local, expected_size = expected_size, size = size, _id = _id }