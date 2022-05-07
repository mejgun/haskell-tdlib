{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.File where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.LocalFile as LocalFile
import qualified TD.Reply.RemoteFile as RemoteFile
import qualified Utils as U

data File = -- | Represents a file
  File
  { -- | Information about the remote copy of the file
    remote :: Maybe RemoteFile.RemoteFile,
    -- | Information about the local copy of the file
    local :: Maybe LocalFile.LocalFile,
    -- | Approximate file size in bytes in case the exact file size is unknown. Can be used to show download/upload progress
    expected_size :: Maybe Int,
    -- | File size, in bytes; 0 if unknown
    size :: Maybe Int,
    -- | Unique file identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show File where
  show
    File
      { remote = remote,
        local = local,
        expected_size = expected_size,
        size = size,
        _id = _id
      } =
      "File"
        ++ U.cc
          [ U.p "remote" remote,
            U.p "local" local,
            U.p "expected_size" expected_size,
            U.p "size" size,
            U.p "_id" _id
          ]

instance T.FromJSON File where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "file" -> parseFile v
      _ -> fail ""
    where
      parseFile :: A.Value -> T.Parser File
      parseFile = A.withObject "File" $ \o -> do
        remote_ <- o A..:? "remote"
        local_ <- o A..:? "local"
        expected_size_ <- mconcat [o A..:? "expected_size", U.rm <$> (o A..: "expected_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        size_ <- mconcat [o A..:? "size", U.rm <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ File {remote = remote_, local = local_, expected_size = expected_size_, size = size_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON File where
  toJSON
    File
      { remote = remote,
        local = local,
        expected_size = expected_size,
        size = size,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "file",
          "remote" A..= remote,
          "local" A..= local,
          "expected_size" A..= expected_size,
          "size" A..= size,
          "id" A..= _id
        ]
