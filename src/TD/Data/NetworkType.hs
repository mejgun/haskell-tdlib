module TD.Data.NetworkType
  ( NetworkType(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data NetworkType -- ^ Represents the type of a network
  = NetworkTypeNone -- ^ The network is not available
  | NetworkTypeMobile -- ^ A mobile network
  | NetworkTypeMobileRoaming -- ^ A mobile roaming network
  | NetworkTypeWiFi -- ^ A Wi-Fi network
  | NetworkTypeOther -- ^ A different network type (e.g., Ethernet network)
  deriving (Eq)

instance Show NetworkType where
  show NetworkTypeNone
      = "NetworkTypeNone"
  show NetworkTypeMobile
      = "NetworkTypeMobile"
  show NetworkTypeMobileRoaming
      = "NetworkTypeMobileRoaming"
  show NetworkTypeWiFi
      = "NetworkTypeWiFi"
  show NetworkTypeOther
      = "NetworkTypeOther"

instance AT.FromJSON NetworkType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "networkTypeNone"          -> pure NetworkTypeNone
      "networkTypeMobile"        -> pure NetworkTypeMobile
      "networkTypeMobileRoaming" -> pure NetworkTypeMobileRoaming
      "networkTypeWiFi"          -> pure NetworkTypeWiFi
      "networkTypeOther"         -> pure NetworkTypeOther
      _                          -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON NetworkType where
  toJSON NetworkTypeNone
      = A.object
        [ "@type" A..= AT.String "networkTypeNone"
        ]
  toJSON NetworkTypeMobile
      = A.object
        [ "@type" A..= AT.String "networkTypeMobile"
        ]
  toJSON NetworkTypeMobileRoaming
      = A.object
        [ "@type" A..= AT.String "networkTypeMobileRoaming"
        ]
  toJSON NetworkTypeWiFi
      = A.object
        [ "@type" A..= AT.String "networkTypeWiFi"
        ]
  toJSON NetworkTypeOther
      = A.object
        [ "@type" A..= AT.String "networkTypeOther"
        ]

