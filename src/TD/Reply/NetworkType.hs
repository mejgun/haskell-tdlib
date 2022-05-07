{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.NetworkType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents the type of a network
data NetworkType
  = -- | The network is not available
    NetworkTypeNone
  | -- | A mobile network
    NetworkTypeMobile
  | -- | A mobile roaming network
    NetworkTypeMobileRoaming
  | -- | A Wi-Fi network
    NetworkTypeWiFi
  | -- | A different network type (e.g., Ethernet network)
    NetworkTypeOther
  deriving (Eq)

instance Show NetworkType where
  show NetworkTypeNone =
    "NetworkTypeNone"
      ++ U.cc
        []
  show NetworkTypeMobile =
    "NetworkTypeMobile"
      ++ U.cc
        []
  show NetworkTypeMobileRoaming =
    "NetworkTypeMobileRoaming"
      ++ U.cc
        []
  show NetworkTypeWiFi =
    "NetworkTypeWiFi"
      ++ U.cc
        []
  show NetworkTypeOther =
    "NetworkTypeOther"
      ++ U.cc
        []

instance T.FromJSON NetworkType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "networkTypeNone" -> parseNetworkTypeNone v
      "networkTypeMobile" -> parseNetworkTypeMobile v
      "networkTypeMobileRoaming" -> parseNetworkTypeMobileRoaming v
      "networkTypeWiFi" -> parseNetworkTypeWiFi v
      "networkTypeOther" -> parseNetworkTypeOther v
      _ -> fail ""
    where
      parseNetworkTypeNone :: A.Value -> T.Parser NetworkType
      parseNetworkTypeNone = A.withObject "NetworkTypeNone" $ \o -> do
        return $ NetworkTypeNone {}

      parseNetworkTypeMobile :: A.Value -> T.Parser NetworkType
      parseNetworkTypeMobile = A.withObject "NetworkTypeMobile" $ \o -> do
        return $ NetworkTypeMobile {}

      parseNetworkTypeMobileRoaming :: A.Value -> T.Parser NetworkType
      parseNetworkTypeMobileRoaming = A.withObject "NetworkTypeMobileRoaming" $ \o -> do
        return $ NetworkTypeMobileRoaming {}

      parseNetworkTypeWiFi :: A.Value -> T.Parser NetworkType
      parseNetworkTypeWiFi = A.withObject "NetworkTypeWiFi" $ \o -> do
        return $ NetworkTypeWiFi {}

      parseNetworkTypeOther :: A.Value -> T.Parser NetworkType
      parseNetworkTypeOther = A.withObject "NetworkTypeOther" $ \o -> do
        return $ NetworkTypeOther {}
  parseJSON _ = fail ""

instance T.ToJSON NetworkType where
  toJSON NetworkTypeNone =
    A.object
      [ "@type" A..= T.String "networkTypeNone"
      ]
  toJSON NetworkTypeMobile =
    A.object
      [ "@type" A..= T.String "networkTypeMobile"
      ]
  toJSON NetworkTypeMobileRoaming =
    A.object
      [ "@type" A..= T.String "networkTypeMobileRoaming"
      ]
  toJSON NetworkTypeWiFi =
    A.object
      [ "@type" A..= T.String "networkTypeWiFi"
      ]
  toJSON NetworkTypeOther =
    A.object
      [ "@type" A..= T.String "networkTypeOther"
      ]
