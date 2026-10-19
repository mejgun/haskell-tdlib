module TD.Query.SendTonCenterApiRequest
  (SendTonCenterApiRequest(..)
  , defaultSendTonCenterApiRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonCenterApiRequestType as TonCenterApiRequestType

-- | Sends a request to TON Center API and returns its response in JSON format. Returns 'TD.Data.Text.Text'
data SendTonCenterApiRequest
  = SendTonCenterApiRequest
    { endpoint :: Maybe T.Text                                          -- ^ The path of the requested endpoint. See https://toncenter.com/api/v3/index.html for the list of supported endpoints
    , _type    :: Maybe TonCenterApiRequestType.TonCenterApiRequestType -- ^ Type of the request
    }
  deriving (Eq, Show)

instance I.ShortShow SendTonCenterApiRequest where
  shortShow
    SendTonCenterApiRequest
      { endpoint = endpoint_
      , _type    = _type_
      }
        = "SendTonCenterApiRequest"
          ++ I.cc
          [ "endpoint" `I.p` endpoint_
          , "_type"    `I.p` _type_
          ]

instance AT.ToJSON SendTonCenterApiRequest where
  toJSON
    SendTonCenterApiRequest
      { endpoint = endpoint_
      , _type    = _type_
      }
        = A.object
          [ "@type"    A..= AT.String "sendTonCenterApiRequest"
          , "endpoint" A..= endpoint_
          , "type"     A..= _type_
          ]

defaultSendTonCenterApiRequest :: SendTonCenterApiRequest
defaultSendTonCenterApiRequest =
  SendTonCenterApiRequest
    { endpoint = Nothing
    , _type    = Nothing
    }

