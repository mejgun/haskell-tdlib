module TD.Data.NetworkStatisticsEntry
  (NetworkStatisticsEntry(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FileType as FileType
import qualified TD.Data.NetworkType as NetworkType

-- | Contains statistics about network usage
data NetworkStatisticsEntry
  = NetworkStatisticsEntryFile -- ^ Contains information about the total amount of data that was used to send and receive files
    { file_type      :: Maybe FileType.FileType       -- ^ Type of the file the data is part of; pass null if the data isn't related to files
    , network_type   :: Maybe NetworkType.NetworkType -- ^ Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
    , sent_bytes     :: Maybe Int                     -- ^ Total number of bytes sent
    , received_bytes :: Maybe Int                     -- ^ Total number of bytes received
    }
  | NetworkStatisticsEntryCall -- ^ Contains information about the total amount of data that was used for calls
    { network_type   :: Maybe NetworkType.NetworkType -- ^ Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
    , sent_bytes     :: Maybe Int                     -- ^ Total number of bytes sent
    , received_bytes :: Maybe Int                     -- ^ Total number of bytes received
    , duration       :: Maybe Double                  -- ^ Total call duration, in seconds
    }
  deriving (Eq, Show)

instance I.ShortShow NetworkStatisticsEntry where
  shortShow NetworkStatisticsEntryFile
    { file_type      = file_type_
    , network_type   = network_type_
    , sent_bytes     = sent_bytes_
    , received_bytes = received_bytes_
    }
      = "NetworkStatisticsEntryFile"
        ++ I.cc
        [ "file_type"      `I.p` file_type_
        , "network_type"   `I.p` network_type_
        , "sent_bytes"     `I.p` sent_bytes_
        , "received_bytes" `I.p` received_bytes_
        ]
  shortShow NetworkStatisticsEntryCall
    { network_type   = network_type_
    , sent_bytes     = sent_bytes_
    , received_bytes = received_bytes_
    , duration       = duration_
    }
      = "NetworkStatisticsEntryCall"
        ++ I.cc
        [ "network_type"   `I.p` network_type_
        , "sent_bytes"     `I.p` sent_bytes_
        , "received_bytes" `I.p` received_bytes_
        , "duration"       `I.p` duration_
        ]

instance AT.FromJSON NetworkStatisticsEntry where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "networkStatisticsEntryFile" -> parseNetworkStatisticsEntryFile v
      "networkStatisticsEntryCall" -> parseNetworkStatisticsEntryCall v
      _                            -> mempty
    
    where
      parseNetworkStatisticsEntryFile :: A.Value -> AT.Parser NetworkStatisticsEntry
      parseNetworkStatisticsEntryFile = A.withObject "NetworkStatisticsEntryFile" $ \o -> do
        file_type_      <- o A..:?  "file_type"
        network_type_   <- o A..:?  "network_type"
        sent_bytes_     <- o A..:?  "sent_bytes"
        received_bytes_ <- o A..:?  "received_bytes"
        pure $ NetworkStatisticsEntryFile
          { file_type      = file_type_
          , network_type   = network_type_
          , sent_bytes     = sent_bytes_
          , received_bytes = received_bytes_
          }
      parseNetworkStatisticsEntryCall :: A.Value -> AT.Parser NetworkStatisticsEntry
      parseNetworkStatisticsEntryCall = A.withObject "NetworkStatisticsEntryCall" $ \o -> do
        network_type_   <- o A..:?  "network_type"
        sent_bytes_     <- o A..:?  "sent_bytes"
        received_bytes_ <- o A..:?  "received_bytes"
        duration_       <- o A..:?  "duration"
        pure $ NetworkStatisticsEntryCall
          { network_type   = network_type_
          , sent_bytes     = sent_bytes_
          , received_bytes = received_bytes_
          , duration       = duration_
          }
  parseJSON _ = mempty

instance AT.ToJSON NetworkStatisticsEntry where
  toJSON NetworkStatisticsEntryFile
    { file_type      = file_type_
    , network_type   = network_type_
    , sent_bytes     = sent_bytes_
    , received_bytes = received_bytes_
    }
      = A.object
        [ "@type"          A..= AT.String "networkStatisticsEntryFile"
        , "file_type"      A..= file_type_
        , "network_type"   A..= network_type_
        , "sent_bytes"     A..= sent_bytes_
        , "received_bytes" A..= received_bytes_
        ]
  toJSON NetworkStatisticsEntryCall
    { network_type   = network_type_
    , sent_bytes     = sent_bytes_
    , received_bytes = received_bytes_
    , duration       = duration_
    }
      = A.object
        [ "@type"          A..= AT.String "networkStatisticsEntryCall"
        , "network_type"   A..= network_type_
        , "sent_bytes"     A..= sent_bytes_
        , "received_bytes" A..= received_bytes_
        , "duration"       A..= duration_
        ]

