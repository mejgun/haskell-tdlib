module TD.Data.StorageStatistics
  (StorageStatistics(..)) where

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
  deriving (Eq, Show)

instance I.ShortShow StorageStatistics where
  shortShow StorageStatistics
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

