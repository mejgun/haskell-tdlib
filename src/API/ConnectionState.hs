-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectionState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ConnectionState = 
 ConnectionStateWaitingForNetwork 
 | ConnectionStateConnectingToProxy 
 | ConnectionStateConnecting 
 | ConnectionStateUpdating 
 | ConnectionStateReady deriving (Show)

instance T.ToJSON ConnectionState where
 toJSON (ConnectionStateWaitingForNetwork {  }) =
  A.object [ "@type" A..= T.String "connectionStateWaitingForNetwork" ]

 toJSON (ConnectionStateConnectingToProxy {  }) =
  A.object [ "@type" A..= T.String "connectionStateConnectingToProxy" ]

 toJSON (ConnectionStateConnecting {  }) =
  A.object [ "@type" A..= T.String "connectionStateConnecting" ]

 toJSON (ConnectionStateUpdating {  }) =
  A.object [ "@type" A..= T.String "connectionStateUpdating" ]

 toJSON (ConnectionStateReady {  }) =
  A.object [ "@type" A..= T.String "connectionStateReady" ]

instance T.FromJSON ConnectionState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "connectionStateWaitingForNetwork" -> parseConnectionStateWaitingForNetwork v
   "connectionStateConnectingToProxy" -> parseConnectionStateConnectingToProxy v
   "connectionStateConnecting" -> parseConnectionStateConnecting v
   "connectionStateUpdating" -> parseConnectionStateUpdating v
   "connectionStateReady" -> parseConnectionStateReady v
   _ -> mempty
  where
   parseConnectionStateWaitingForNetwork :: A.Value -> T.Parser ConnectionState
   parseConnectionStateWaitingForNetwork = A.withObject "ConnectionStateWaitingForNetwork" $ \o -> do
    return $ ConnectionStateWaitingForNetwork {  }

   parseConnectionStateConnectingToProxy :: A.Value -> T.Parser ConnectionState
   parseConnectionStateConnectingToProxy = A.withObject "ConnectionStateConnectingToProxy" $ \o -> do
    return $ ConnectionStateConnectingToProxy {  }

   parseConnectionStateConnecting :: A.Value -> T.Parser ConnectionState
   parseConnectionStateConnecting = A.withObject "ConnectionStateConnecting" $ \o -> do
    return $ ConnectionStateConnecting {  }

   parseConnectionStateUpdating :: A.Value -> T.Parser ConnectionState
   parseConnectionStateUpdating = A.withObject "ConnectionStateUpdating" $ \o -> do
    return $ ConnectionStateUpdating {  }

   parseConnectionStateReady :: A.Value -> T.Parser ConnectionState
   parseConnectionStateReady = A.withObject "ConnectionStateReady" $ \o -> do
    return $ ConnectionStateReady {  }