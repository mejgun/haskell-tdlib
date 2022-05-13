{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPushReceiverId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously @payload JSON-encoded push notification payload
data GetPushReceiverId = GetPushReceiverId
  { -- |
    payload :: Maybe String
  }
  deriving (Eq)

instance Show GetPushReceiverId where
  show
    GetPushReceiverId
      { payload = payload_
      } =
      "GetPushReceiverId"
        ++ U.cc
          [ U.p "payload" payload_
          ]

instance T.ToJSON GetPushReceiverId where
  toJSON
    GetPushReceiverId
      { payload = payload_
      } =
      A.object
        [ "@type" A..= T.String "getPushReceiverId",
          "payload" A..= payload_
        ]
