module TD.Query.ProcessPushNotification
  (ProcessPushNotification(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ProcessPushNotification -- ^ Handles a push notification. Returns error with code 406 if the push notification is not supported and connection to the server is required to fetch new data. Can be called before authorization
  = ProcessPushNotification
    { payload :: Maybe T.Text -- ^ JSON-encoded push notification payload with all fields sent by the server, and "google.sent_time" and "google.notification.sound" fields added
    }
  deriving (Eq)

instance Show ProcessPushNotification where
  show
    ProcessPushNotification
      { payload = payload_
      }
        = "ProcessPushNotification"
          ++ I.cc
          [ "payload" `I.p` payload_
          ]

instance AT.ToJSON ProcessPushNotification where
  toJSON
    ProcessPushNotification
      { payload = payload_
      }
        = A.object
          [ "@type"   A..= AT.String "processPushNotification"
          , "payload" A..= payload_
          ]

