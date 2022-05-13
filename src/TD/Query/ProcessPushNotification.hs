{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ProcessPushNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Handles a push notification. Returns error with code 406 if the push notification is not supported and connection to the server is required to fetch new data. Can be called before authorization
data ProcessPushNotification = ProcessPushNotification
  { -- | JSON-encoded push notification payload with all fields sent by the server, and "google.sent_time" and "google.notification.sound" fields added
    payload :: Maybe String
  }
  deriving (Eq)

instance Show ProcessPushNotification where
  show
    ProcessPushNotification
      { payload = payload_
      } =
      "ProcessPushNotification"
        ++ U.cc
          [ U.p "payload" payload_
          ]

instance T.ToJSON ProcessPushNotification where
  toJSON
    ProcessPushNotification
      { payload = payload_
      } =
      A.object
        [ "@type" A..= T.String "processPushNotification",
          "payload" A..= payload_
        ]
