{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.NetworkStatisticsEntry where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.FileType as FileType
import qualified TD.Reply.NetworkType as NetworkType
import qualified Utils as U

-- | Contains statistics about network usage
data NetworkStatisticsEntry
  = -- | Contains information about the total amount of data that was used to send and receive files
    NetworkStatisticsEntryFile
      { -- |
        received_bytes :: Maybe Int,
        -- | Total number of bytes sent @received_bytes Total number of bytes received
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
      { received_bytes = received_bytes,
        sent_bytes = sent_bytes,
        network_type = network_type,
        file_type = file_type
      } =
      "NetworkStatisticsEntryFile"
        ++ U.cc
          [ U.p "received_bytes" received_bytes,
            U.p "sent_bytes" sent_bytes,
            U.p "network_type" network_type,
            U.p "file_type" file_type
          ]
  show
    NetworkStatisticsEntryCall
      { duration = duration,
        received_bytes = received_bytes,
        sent_bytes = sent_bytes,
        network_type = network_type
      } =
      "NetworkStatisticsEntryCall"
        ++ U.cc
          [ U.p "duration" duration,
            U.p "received_bytes" received_bytes,
            U.p "sent_bytes" sent_bytes,
            U.p "network_type" network_type
          ]

instance T.FromJSON NetworkStatisticsEntry where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "networkStatisticsEntryFile" -> parseNetworkStatisticsEntryFile v
      "networkStatisticsEntryCall" -> parseNetworkStatisticsEntryCall v
      _ -> fail ""
    where
      parseNetworkStatisticsEntryFile :: A.Value -> T.Parser NetworkStatisticsEntry
      parseNetworkStatisticsEntryFile = A.withObject "NetworkStatisticsEntryFile" $ \o -> do
        received_bytes_ <- mconcat [o A..:? "received_bytes", U.rm <$> (o A..: "received_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
        sent_bytes_ <- mconcat [o A..:? "sent_bytes", U.rm <$> (o A..: "sent_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
        network_type_ <- o A..:? "network_type"
        file_type_ <- o A..:? "file_type"
        return $ NetworkStatisticsEntryFile {received_bytes = received_bytes_, sent_bytes = sent_bytes_, network_type = network_type_, file_type = file_type_}

      parseNetworkStatisticsEntryCall :: A.Value -> T.Parser NetworkStatisticsEntry
      parseNetworkStatisticsEntryCall = A.withObject "NetworkStatisticsEntryCall" $ \o -> do
        duration_ <- o A..:? "duration"
        received_bytes_ <- mconcat [o A..:? "received_bytes", U.rm <$> (o A..: "received_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
        sent_bytes_ <- mconcat [o A..:? "sent_bytes", U.rm <$> (o A..: "sent_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
        network_type_ <- o A..:? "network_type"
        return $ NetworkStatisticsEntryCall {duration = duration_, received_bytes = received_bytes_, sent_bytes = sent_bytes_, network_type = network_type_}
  parseJSON _ = fail ""

instance T.ToJSON NetworkStatisticsEntry where
  toJSON
    NetworkStatisticsEntryFile
      { received_bytes = received_bytes,
        sent_bytes = sent_bytes,
        network_type = network_type,
        file_type = file_type
      } =
      A.object
        [ "@type" A..= T.String "networkStatisticsEntryFile",
          "received_bytes" A..= received_bytes,
          "sent_bytes" A..= sent_bytes,
          "network_type" A..= network_type,
          "file_type" A..= file_type
        ]
  toJSON
    NetworkStatisticsEntryCall
      { duration = duration,
        received_bytes = received_bytes,
        sent_bytes = sent_bytes,
        network_type = network_type
      } =
      A.object
        [ "@type" A..= T.String "networkStatisticsEntryCall",
          "duration" A..= duration,
          "received_bytes" A..= received_bytes,
          "sent_bytes" A..= sent_bytes,
          "network_type" A..= network_type
        ]
