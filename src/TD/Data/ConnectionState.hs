module TD.Data.ConnectionState
  ( ConnectionState(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Describes the current state of the connection to Telegram servers
data ConnectionState
  = ConnectionStateWaitingForNetwork -- ^ Currently waiting for the network to become available. Use setNetworkType to change the available network type
  | ConnectionStateConnectingToProxy -- ^ Currently establishing a connection with a proxy server
  | ConnectionStateConnecting -- ^ Currently establishing a connection to the Telegram servers
  | ConnectionStateUpdating -- ^ Downloading data received while the application was offline
  | ConnectionStateReady -- ^ There is a working connection to the Telegram servers
  deriving (Eq)

instance Show ConnectionState where
  show ConnectionStateWaitingForNetwork
      = "ConnectionStateWaitingForNetwork"
  show ConnectionStateConnectingToProxy
      = "ConnectionStateConnectingToProxy"
  show ConnectionStateConnecting
      = "ConnectionStateConnecting"
  show ConnectionStateUpdating
      = "ConnectionStateUpdating"
  show ConnectionStateReady
      = "ConnectionStateReady"

instance AT.FromJSON ConnectionState where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "connectionStateWaitingForNetwork" -> pure ConnectionStateWaitingForNetwork
      "connectionStateConnectingToProxy" -> pure ConnectionStateConnectingToProxy
      "connectionStateConnecting"        -> pure ConnectionStateConnecting
      "connectionStateUpdating"          -> pure ConnectionStateUpdating
      "connectionStateReady"             -> pure ConnectionStateReady
      _                                  -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON ConnectionState where
  toJSON ConnectionStateWaitingForNetwork
      = A.object
        [ "@type" A..= AT.String "connectionStateWaitingForNetwork"
        ]
  toJSON ConnectionStateConnectingToProxy
      = A.object
        [ "@type" A..= AT.String "connectionStateConnectingToProxy"
        ]
  toJSON ConnectionStateConnecting
      = A.object
        [ "@type" A..= AT.String "connectionStateConnecting"
        ]
  toJSON ConnectionStateUpdating
      = A.object
        [ "@type" A..= AT.String "connectionStateUpdating"
        ]
  toJSON ConnectionStateReady
      = A.object
        [ "@type" A..= AT.String "connectionStateReady"
        ]

