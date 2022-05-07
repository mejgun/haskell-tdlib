{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ConnectionState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the current state of the connection to Telegram servers
data ConnectionState
  = -- | Currently waiting for the network to become available. Use setNetworkType to change the available network type
    ConnectionStateWaitingForNetwork
  | -- | Currently establishing a connection with a proxy server
    ConnectionStateConnectingToProxy
  | -- | Currently establishing a connection to the Telegram servers
    ConnectionStateConnecting
  | -- | Downloading data received while the application was offline
    ConnectionStateUpdating
  | -- | There is a working connection to the Telegram servers
    ConnectionStateReady
  deriving (Eq)

instance Show ConnectionState where
  show ConnectionStateWaitingForNetwork =
    "ConnectionStateWaitingForNetwork"
      ++ U.cc
        []
  show ConnectionStateConnectingToProxy =
    "ConnectionStateConnectingToProxy"
      ++ U.cc
        []
  show ConnectionStateConnecting =
    "ConnectionStateConnecting"
      ++ U.cc
        []
  show ConnectionStateUpdating =
    "ConnectionStateUpdating"
      ++ U.cc
        []
  show ConnectionStateReady =
    "ConnectionStateReady"
      ++ U.cc
        []

instance T.FromJSON ConnectionState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "connectionStateWaitingForNetwork" -> parseConnectionStateWaitingForNetwork v
      "connectionStateConnectingToProxy" -> parseConnectionStateConnectingToProxy v
      "connectionStateConnecting" -> parseConnectionStateConnecting v
      "connectionStateUpdating" -> parseConnectionStateUpdating v
      "connectionStateReady" -> parseConnectionStateReady v
      _ -> fail ""
    where
      parseConnectionStateWaitingForNetwork :: A.Value -> T.Parser ConnectionState
      parseConnectionStateWaitingForNetwork = A.withObject "ConnectionStateWaitingForNetwork" $ \o -> do
        return $ ConnectionStateWaitingForNetwork {}

      parseConnectionStateConnectingToProxy :: A.Value -> T.Parser ConnectionState
      parseConnectionStateConnectingToProxy = A.withObject "ConnectionStateConnectingToProxy" $ \o -> do
        return $ ConnectionStateConnectingToProxy {}

      parseConnectionStateConnecting :: A.Value -> T.Parser ConnectionState
      parseConnectionStateConnecting = A.withObject "ConnectionStateConnecting" $ \o -> do
        return $ ConnectionStateConnecting {}

      parseConnectionStateUpdating :: A.Value -> T.Parser ConnectionState
      parseConnectionStateUpdating = A.withObject "ConnectionStateUpdating" $ \o -> do
        return $ ConnectionStateUpdating {}

      parseConnectionStateReady :: A.Value -> T.Parser ConnectionState
      parseConnectionStateReady = A.withObject "ConnectionStateReady" $ \o -> do
        return $ ConnectionStateReady {}
  parseJSON _ = fail ""

instance T.ToJSON ConnectionState where
  toJSON ConnectionStateWaitingForNetwork =
    A.object
      [ "@type" A..= T.String "connectionStateWaitingForNetwork"
      ]
  toJSON ConnectionStateConnectingToProxy =
    A.object
      [ "@type" A..= T.String "connectionStateConnectingToProxy"
      ]
  toJSON ConnectionStateConnecting =
    A.object
      [ "@type" A..= T.String "connectionStateConnecting"
      ]
  toJSON ConnectionStateUpdating =
    A.object
      [ "@type" A..= T.String "connectionStateUpdating"
      ]
  toJSON ConnectionStateReady =
    A.object
      [ "@type" A..= T.String "connectionStateReady"
      ]
