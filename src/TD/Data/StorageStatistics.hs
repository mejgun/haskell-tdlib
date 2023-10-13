module TD.Data.StorageStatistics
  ( StorageStatistics(..)    
  , defaultStorageStatistics 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StorageStatisticsByChat as StorageStatisticsByChat

data StorageStatistics
  = StorageStatistics -- ^ Contains the exact storage usage statistics split by chats and file type
    { size    :: Maybe Int                                               -- ^ Total size of files, in bytes
    , count   :: Maybe Int                                               -- ^ Total number of files
    , by_chat :: Maybe [StorageStatisticsByChat.StorageStatisticsByChat] -- ^ Statistics split by chats
    }
  deriving (Eq)

instance Show StorageStatistics where
  show StorageStatistics
    { size    = size_
    , count   = count_
    , by_chat = by_chat_
    }
      = "StorageStatistics"
        ++ I.cc
        [ "size"    `I.p` size_
        , "count"   `I.p` count_
        , "by_chat" `I.p` by_chat_
        ]

instance AT.FromJSON StorageStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storageStatistics" -> parseStorageStatistics v
      _                   -> mempty
    
    where
      parseStorageStatistics :: A.Value -> AT.Parser StorageStatistics
      parseStorageStatistics = A.withObject "StorageStatistics" $ \o -> do
        size_    <- o A..:?  "size"
        count_   <- o A..:?  "count"
        by_chat_ <- o A..:?  "by_chat"
        pure $ StorageStatistics
          { size    = size_
          , count   = count_
          , by_chat = by_chat_
          }
  parseJSON _ = mempty

instance AT.ToJSON StorageStatistics where
  toJSON StorageStatistics
    { size    = size_
    , count   = count_
    , by_chat = by_chat_
    }
      = A.object
        [ "@type"   A..= AT.String "storageStatistics"
        , "size"    A..= size_
        , "count"   A..= count_
        , "by_chat" A..= by_chat_
        ]

defaultStorageStatistics :: StorageStatistics
defaultStorageStatistics =
  StorageStatistics
    { size    = Nothing
    , count   = Nothing
    , by_chat = Nothing
    }

