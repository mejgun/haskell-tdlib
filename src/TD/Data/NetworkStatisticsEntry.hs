{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.NetworkStatisticsEntry where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FileType as FileType
import qualified TD.Data.NetworkType as NetworkType
import qualified Utils as U

-- | Contains statistics about network usage
data NetworkStatisticsEntry
  = -- | Contains information about the total amount of data that was used to send and receive files
    NetworkStatisticsEntryFile
      { -- | Total number of bytes received
        received_bytes :: Maybe Int,
        -- | Total number of bytes sent
        sent_bytes :: Maybe Int,
        -- | Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
        network_type :: Maybe NetworkType.NetworkType,
        -- | Type of the file the data is part of; pass null if the data isn't related to files
        file_type :: Maybe FileType.FileType
      }
  | -- | Contains information about the total amount of data that was used for calls
    NetworkStatisticsEntryCall
      { -- | Total call duration, in seconds
        duration :: Maybe Float,
        -- | Total number of bytes received
        received_bytes :: Maybe Int,
        -- | Total number of bytes sent
        sent_bytes :: Maybe Int,
        -- | Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
        network_type :: Maybe NetworkType.NetworkType
      }
  deriving (Eq)

instance Show NetworkStatisticsEntry where
  show
    NetworkStatisticsEntryFile
      { received_bytes = received_bytes_,
        sent_bytes = sent_bytes_,
        network_type = network_type_,
        file_type = file_type_
      } =
      "NetworkStatisticsEntryFile"
        ++ U.cc
          [ U.p "received_bytes" received_bytes_,
            U.p "sent_bytes" sent_bytes_,
            U.p "network_type" network_type_,
            U.p "file_type" file_type_
          ]
  show
    NetworkStatisticsEntryCall
      { duration = duration_,
        received_bytes = received_bytes_,
        sent_bytes = sent_bytes_,
        network_type = network_type_
      } =
      "NetworkStatisticsEntryCall"
        ++ U.cc
          [ U.p "duration" duration_,
            U.p "received_bytes" received_bytes_,
            U.p "sent_bytes" sent_bytes_,
            U.p "network_type" network_type_
          ]

instance T.FromJSON NetworkStatisticsEntry where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "networkStatisticsEntryFile" -> parseNetworkStatisticsEntryFile v
      "networkStatisticsEntryCall" -> parseNetworkStatisticsEntryCall v
      _ -> mempty
    where
      parseNetworkStatisticsEntryFile :: A.Value -> T.Parser NetworkStatisticsEntry
      parseNetworkStatisticsEntryFile = A.withObject "NetworkStatisticsEntryFile" $ \o -> do
        received_bytes_ <- o A..:? "received_bytes"
        sent_bytes_ <- o A..:? "sent_bytes"
        network_type_ <- o A..:? "network_type"
        file_type_ <- o A..:? "file_type"
        return $ NetworkStatisticsEntryFile {received_bytes = received_bytes_, sent_bytes = sent_bytes_, network_type = network_type_, file_type = file_type_}

      parseNetworkStatisticsEntryCall :: A.Value -> T.Parser NetworkStatisticsEntry
      parseNetworkStatisticsEntryCall = A.withObject "NetworkStatisticsEntryCall" $ \o -> do
        duration_ <- o A..:? "duration"
        received_bytes_ <- o A..:? "received_bytes"
        sent_bytes_ <- o A..:? "sent_bytes"
        network_type_ <- o A..:? "network_type"
        return $ NetworkStatisticsEntryCall {duration = duration_, received_bytes = received_bytes_, sent_bytes = sent_bytes_, network_type = network_type_}
  parseJSON _ = mempty

instance T.ToJSON NetworkStatisticsEntry where
  toJSON
    NetworkStatisticsEntryFile
      { received_bytes = received_bytes_,
        sent_bytes = sent_bytes_,
        network_type = network_type_,
        file_type = file_type_
      } =
      A.object
        [ "@type" A..= T.String "networkStatisticsEntryFile",
          "received_bytes" A..= received_bytes_,
          "sent_bytes" A..= sent_bytes_,
          "network_type" A..= network_type_,
          "file_type" A..= file_type_
        ]
  toJSON
    NetworkStatisticsEntryCall
      { duration = duration_,
        received_bytes = received_bytes_,
        sent_bytes = sent_bytes_,
        network_type = network_type_
      } =
      A.object
        [ "@type" A..= T.String "networkStatisticsEntryCall",
          "duration" A..= duration_,
          "received_bytes" A..= received_bytes_,
          "sent_bytes" A..= sent_bytes_,
          "network_type" A..= network_type_
        ]
