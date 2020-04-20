-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectionState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ConnectionState = 
 ConnectionStateWaitingForNetwork 
 | ConnectionStateConnectingToProxy 
 | ConnectionStateConnecting 
 | ConnectionStateUpdating 
 | ConnectionStateReady -- deriving (Show)

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
-- connectionStateWaitingForNetwork ConnectionState 

-- connectionStateConnectingToProxy ConnectionState 

-- connectionStateConnecting ConnectionState 

-- connectionStateUpdating ConnectionState 

-- connectionStateReady ConnectionState 

