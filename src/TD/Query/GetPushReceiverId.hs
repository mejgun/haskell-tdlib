module TD.Query.GetPushReceiverId(GetPushReceiverId(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetPushReceiverId -- ^ Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously
  = GetPushReceiverId
    { payload :: Maybe T.Text -- ^ JSON-encoded push notification payload
    }
  deriving (Eq)

instance Show GetPushReceiverId where
  show
    GetPushReceiverId
      { payload = payload_
      }
        = "GetPushReceiverId"
          ++ I.cc
          [ "payload" `I.p` payload_
          ]

instance AT.ToJSON GetPushReceiverId where
  toJSON
    GetPushReceiverId
      { payload = payload_
      }
        = A.object
          [ "@type"   A..= AT.String "getPushReceiverId"
          , "payload" A..= payload_
          ]
