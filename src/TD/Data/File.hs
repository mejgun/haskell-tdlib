module TD.Data.File
  (File(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LocalFile as LocalFile
import qualified TD.Data.RemoteFile as RemoteFile

data File
  = File -- ^ Represents a file
    { _id           :: Maybe Int                   -- ^ Unique file identifier
    , size          :: Maybe Int                   -- ^ File size, in bytes; 0 if unknown
    , expected_size :: Maybe Int                   -- ^ Approximate file size in bytes in case the exact file size is unknown. Can be used to show download/upload progress
    , local         :: Maybe LocalFile.LocalFile   -- ^ Information about the local copy of the file
    , remote        :: Maybe RemoteFile.RemoteFile -- ^ Information about the remote copy of the file
    }
  deriving (Eq, Show)

instance I.ShortShow File where
  shortShow File
    { _id           = _id_
    , size          = size_
    , expected_size = expected_size_
    , local         = local_
    , remote        = remote_
    }
      = "File"
        ++ I.cc
        [ "_id"           `I.p` _id_
        , "size"          `I.p` size_
        , "expected_size" `I.p` expected_size_
        , "local"         `I.p` local_
        , "remote"        `I.p` remote_
        ]

instance AT.FromJSON File where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "file" -> parseFile v
      _      -> mempty
    
    where
      parseFile :: A.Value -> AT.Parser File
      parseFile = A.withObject "File" $ \o -> do
        _id_           <- o A..:?  "id"
        size_          <- o A..:?  "size"
        expected_size_ <- o A..:?  "expected_size"
        local_         <- o A..:?  "local"
        remote_        <- o A..:?  "remote"
        pure $ File
          { _id           = _id_
          , size          = size_
          , expected_size = expected_size_
          , local         = local_
          , remote        = remote_
          }
  parseJSON _ = mempty

