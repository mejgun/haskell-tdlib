module TD.Data.StorageStatisticsByFileType
  ( StorageStatisticsByFileType(..)    
  , defaultStorageStatisticsByFileType 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FileType as FileType

data StorageStatisticsByFileType
  = StorageStatisticsByFileType -- ^ Contains the storage usage statistics for a specific file type
    { file_type :: Maybe FileType.FileType -- ^ File type
    , size      :: Maybe Int               -- ^ Total size of the files, in bytes
    , count     :: Maybe Int               -- ^ Total number of files
    }
  deriving (Eq)

instance Show StorageStatisticsByFileType where
  show StorageStatisticsByFileType
    { file_type = file_type_
    , size      = size_
    , count     = count_
    }
      = "StorageStatisticsByFileType"
        ++ I.cc
        [ "file_type" `I.p` file_type_
        , "size"      `I.p` size_
        , "count"     `I.p` count_
        ]

instance AT.FromJSON StorageStatisticsByFileType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storageStatisticsByFileType" -> parseStorageStatisticsByFileType v
      _                             -> mempty
    
    where
      parseStorageStatisticsByFileType :: A.Value -> AT.Parser StorageStatisticsByFileType
      parseStorageStatisticsByFileType = A.withObject "StorageStatisticsByFileType" $ \o -> do
        file_type_ <- o A..:?  "file_type"
        size_      <- o A..:?  "size"
        count_     <- o A..:?  "count"
        pure $ StorageStatisticsByFileType
          { file_type = file_type_
          , size      = size_
          , count     = count_
          }
  parseJSON _ = mempty

instance AT.ToJSON StorageStatisticsByFileType where
  toJSON StorageStatisticsByFileType
    { file_type = file_type_
    , size      = size_
    , count     = count_
    }
      = A.object
        [ "@type"     A..= AT.String "storageStatisticsByFileType"
        , "file_type" A..= file_type_
        , "size"      A..= size_
        , "count"     A..= count_
        ]

defaultStorageStatisticsByFileType :: StorageStatisticsByFileType
defaultStorageStatisticsByFileType =
  StorageStatisticsByFileType
    { file_type = Nothing
    , size      = Nothing
    , count     = Nothing
    }

