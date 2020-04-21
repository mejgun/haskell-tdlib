-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NetworkStatisticsEntry where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType
import {-# SOURCE #-} qualified API.NetworkType as NetworkType

--main = putStrLn "ok"

data NetworkStatisticsEntry = 
 NetworkStatisticsEntryFile { received_bytes :: Int, sent_bytes :: Int, network_type :: NetworkType.NetworkType, file_type :: FileType.FileType }  
 | NetworkStatisticsEntryCall { duration :: Float, received_bytes :: Int, sent_bytes :: Int, network_type :: NetworkType.NetworkType }  deriving (Show)

instance T.ToJSON NetworkStatisticsEntry where
 toJSON (NetworkStatisticsEntryFile { received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type, file_type = file_type }) =
  A.object [ "@type" A..= T.String "networkStatisticsEntryFile", "received_bytes" A..= received_bytes, "sent_bytes" A..= sent_bytes, "network_type" A..= network_type, "file_type" A..= file_type ]

 toJSON (NetworkStatisticsEntryCall { duration = duration, received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type }) =
  A.object [ "@type" A..= T.String "networkStatisticsEntryCall", "duration" A..= duration, "received_bytes" A..= received_bytes, "sent_bytes" A..= sent_bytes, "network_type" A..= network_type ]



instance T.FromJSON NetworkStatisticsEntry where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "networkStatisticsEntryFile" -> parseNetworkStatisticsEntryFile v
   "networkStatisticsEntryCall" -> parseNetworkStatisticsEntryCall v

   _ -> mempty ""
  where
   parseNetworkStatisticsEntryFile :: A.Value -> T.Parser NetworkStatisticsEntry
   parseNetworkStatisticsEntryFile = A.withObject "NetworkStatisticsEntryFile" $ \o -> do
    received_bytes <- o A..: "received_bytes"
    sent_bytes <- o A..: "sent_bytes"
    network_type <- o A..: "network_type"
    file_type <- o A..: "file_type"
    return $ NetworkStatisticsEntryFile { received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type, file_type = file_type }

   parseNetworkStatisticsEntryCall :: A.Value -> T.Parser NetworkStatisticsEntry
   parseNetworkStatisticsEntryCall = A.withObject "NetworkStatisticsEntryCall" $ \o -> do
    duration <- o A..: "duration"
    received_bytes <- o A..: "received_bytes"
    sent_bytes <- o A..: "sent_bytes"
    network_type <- o A..: "network_type"
    return $ NetworkStatisticsEntryCall { duration = duration, received_bytes = received_bytes, sent_bytes = sent_bytes, network_type = network_type }