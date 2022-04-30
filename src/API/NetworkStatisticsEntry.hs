-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NetworkStatisticsEntry where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.FileType as FileType
import {-# SOURCE #-} qualified API.NetworkType as NetworkType

-- |
-- 
-- Contains statistics about network usage
data NetworkStatisticsEntry = 
 -- |
 -- 
 -- Contains information about the total amount of data that was used to send and receive files
 -- 
 -- __file_type__ Type of the file the data is part of; pass null if the data isn't related to files
 -- 
 -- __network_type__ Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
 -- 
 -- __sent_bytes__ Total number of bytes sent
 -- 
 -- __received_bytes__ Total number of bytes received
 NetworkStatisticsEntryFile { received_bytes :: Maybe Int, sent_bytes :: Maybe Int, network_type :: Maybe NetworkType.NetworkType, file_type :: Maybe FileType.FileType }  |
 -- |
 -- 
 -- Contains information about the total amount of data that was used for calls
 -- 
 -- __network_type__ Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
 -- 
 -- __sent_bytes__ Total number of bytes sent
 -- 
 -- __received_bytes__ Total number of bytes received
 -- 
 -- __duration__ Total call duration, in seconds
 NetworkStatisticsEntryCall { duration :: Maybe Float, received_bytes :: Maybe Int, sent_bytes :: Maybe Int, network_type :: Maybe NetworkType.NetworkType }  deriving (Eq)

instance Show NetworkStatisticsEntry where
 show NetworkStatisticsEntryFile { received_bytes=received_bytes, sent_bytes=sent_bytes, network_type=network_type, file_type=file_type } =
  "NetworkStatisticsEntryFile" ++ U.cc [U.p "received_bytes" received_bytes, U.p "sent_bytes" sent_bytes, U.p "network_type" network_type, U.p "file_type" file_type ]

 show NetworkStatisticsEntryCall { duration=duration, received_bytes=received_bytes, sent_bytes=sent_bytes, network_type=network_type } =
  "NetworkStatisticsEntryCall" ++ U.cc [U.p "duration" duration, U.p "received_bytes" received_bytes, U.p "sent_bytes" sent_bytes, U.p "network_type" network_type ]

instance T.ToJSON NetworkStatisticsEntry where
 toJSON NetworkStatisticsEntryFile { received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type, file_type = file_type } =
  A.object [ "@type" A..= T.String "networkStatisticsEntryFile", "received_bytes" A..= received_bytes, "sent_bytes" A..= sent_bytes, "network_type" A..= network_type, "file_type" A..= file_type ]

 toJSON NetworkStatisticsEntryCall { duration = duration, received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type } =
  A.object [ "@type" A..= T.String "networkStatisticsEntryCall", "duration" A..= duration, "received_bytes" A..= received_bytes, "sent_bytes" A..= sent_bytes, "network_type" A..= network_type ]

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
    received_bytes <- mconcat [ o A..:? "received_bytes", readMaybe <$> (o A..: "received_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
    sent_bytes <- mconcat [ o A..:? "sent_bytes", readMaybe <$> (o A..: "sent_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
    network_type <- o A..:? "network_type"
    file_type <- o A..:? "file_type"
    return $ NetworkStatisticsEntryFile { received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type, file_type = file_type }

   parseNetworkStatisticsEntryCall :: A.Value -> T.Parser NetworkStatisticsEntry
   parseNetworkStatisticsEntryCall = A.withObject "NetworkStatisticsEntryCall" $ \o -> do
    duration <- o A..:? "duration"
    received_bytes <- mconcat [ o A..:? "received_bytes", readMaybe <$> (o A..: "received_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
    sent_bytes <- mconcat [ o A..:? "sent_bytes", readMaybe <$> (o A..: "sent_bytes" :: T.Parser String)] :: T.Parser (Maybe Int)
    network_type <- o A..:? "network_type"
    return $ NetworkStatisticsEntryCall { duration = duration, received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type }
 parseJSON _ = mempty
