module TD.Data.StorageStatisticsByChat
  (StorageStatisticsByChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StorageStatisticsByFileType as StorageStatisticsByFileType

data StorageStatisticsByChat
  = StorageStatisticsByChat -- ^ Contains the storage usage statistics for a specific chat
    { chat_id      :: Maybe Int                                                       -- ^ Chat identifier; 0 if none
    , size         :: Maybe Int                                                       -- ^ Total size of the files in the chat, in bytes
    , count        :: Maybe Int                                                       -- ^ Total number of files in the chat
    , by_file_type :: Maybe [StorageStatisticsByFileType.StorageStatisticsByFileType] -- ^ Statistics split by file types
    }
  deriving (Eq, Show)

instance I.ShortShow StorageStatisticsByChat where
  shortShow StorageStatisticsByChat
    { chat_id      = chat_id_
    , size         = size_
    , count        = count_
    , by_file_type = by_file_type_
    }
      = "StorageStatisticsByChat"
        ++ I.cc
        [ "chat_id"      `I.p` chat_id_
        , "size"         `I.p` size_
        , "count"        `I.p` count_
        , "by_file_type" `I.p` by_file_type_
        ]

instance AT.FromJSON StorageStatisticsByChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storageStatisticsByChat" -> parseStorageStatisticsByChat v
      _                         -> mempty
    
    where
      parseStorageStatisticsByChat :: A.Value -> AT.Parser StorageStatisticsByChat
      parseStorageStatisticsByChat = A.withObject "StorageStatisticsByChat" $ \o -> do
        chat_id_      <- o A..:?  "chat_id"
        size_         <- o A..:?  "size"
        count_        <- o A..:?  "count"
        by_file_type_ <- o A..:?  "by_file_type"
        pure $ StorageStatisticsByChat
          { chat_id      = chat_id_
          , size         = size_
          , count        = count_
          , by_file_type = by_file_type_
          }
  parseJSON _ = mempty

