module TD.Query.ProcessWebProxyCarrierMessage
  (ProcessWebProxyCarrierMessage(..)
  , defaultProcessWebProxyCarrierMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WebProxyCarrierMessage as WebProxyCarrierMessage

-- | Passes a message, which the page of a web proxy carrier passed to postMessage of the bridge object, to TDLib. Must be called in the order in which the messages were passed. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data ProcessWebProxyCarrierMessage
  = ProcessWebProxyCarrierMessage
    { carrier_id :: Maybe Int                                           -- ^ Identifier of the carrier
    , message    :: Maybe WebProxyCarrierMessage.WebProxyCarrierMessage -- ^ The received message
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessWebProxyCarrierMessage where
  shortShow
    ProcessWebProxyCarrierMessage
      { carrier_id = carrier_id_
      , message    = message_
      }
        = "ProcessWebProxyCarrierMessage"
          ++ I.cc
          [ "carrier_id" `I.p` carrier_id_
          , "message"    `I.p` message_
          ]

instance AT.ToJSON ProcessWebProxyCarrierMessage where
  toJSON
    ProcessWebProxyCarrierMessage
      { carrier_id = carrier_id_
      , message    = message_
      }
        = A.object
          [ "@type"      A..= AT.String "processWebProxyCarrierMessage"
          , "carrier_id" A..= carrier_id_
          , "message"    A..= message_
          ]

defaultProcessWebProxyCarrierMessage :: ProcessWebProxyCarrierMessage
defaultProcessWebProxyCarrierMessage =
  ProcessWebProxyCarrierMessage
    { carrier_id = Nothing
    , message    = Nothing
    }

