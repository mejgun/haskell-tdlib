module TD.Data.ConnectionState
  (ConnectionState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the current state of the connection to Telegram servers
data ConnectionState
  = ConnectionStateWaitingForNetwork -- ^ Waiting for the network to become available. Use setNetworkType to change the available network type
  | ConnectionStateConnectingToProxy -- ^ Establishing a connection with a proxy server
  | ConnectionStateConnecting -- ^ Establishing a connection to the Telegram servers
  | ConnectionStateUpdating -- ^ Downloading data expected to be received while the application was offline
  | ConnectionStateReady -- ^ There is a working connection to the Telegram servers
  deriving (Eq, Show)

instance I.ShortShow ConnectionState where
  shortShow ConnectionStateWaitingForNetwork
      = "ConnectionStateWaitingForNetwork"
  shortShow ConnectionStateConnectingToProxy
      = "ConnectionStateConnectingToProxy"
  shortShow ConnectionStateConnecting
      = "ConnectionStateConnecting"
  shortShow ConnectionStateUpdating
      = "ConnectionStateUpdating"
  shortShow ConnectionStateReady
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

