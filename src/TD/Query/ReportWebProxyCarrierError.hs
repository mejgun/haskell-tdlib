module TD.Query.ReportWebProxyCarrierError
  (ReportWebProxyCarrierError(..)
  , defaultReportWebProxyCarrierError
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WebProxyCarrierError as WebProxyCarrierError

-- | Reports that a web proxy carrier failed. TDLib closes the carrier and decides whether and when to request a new one. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data ReportWebProxyCarrierError
  = ReportWebProxyCarrierError
    { carrier_id :: Maybe Int                                       -- ^ Identifier of the carrier
    , _error     :: Maybe WebProxyCarrierError.WebProxyCarrierError -- ^ The error
    }
  deriving (Eq, Show)

instance I.ShortShow ReportWebProxyCarrierError where
  shortShow
    ReportWebProxyCarrierError
      { carrier_id = carrier_id_
      , _error     = _error_
      }
        = "ReportWebProxyCarrierError"
          ++ I.cc
          [ "carrier_id" `I.p` carrier_id_
          , "_error"     `I.p` _error_
          ]

instance AT.ToJSON ReportWebProxyCarrierError where
  toJSON
    ReportWebProxyCarrierError
      { carrier_id = carrier_id_
      , _error     = _error_
      }
        = A.object
          [ "@type"      A..= AT.String "reportWebProxyCarrierError"
          , "carrier_id" A..= carrier_id_
          , "error"      A..= _error_
          ]

defaultReportWebProxyCarrierError :: ReportWebProxyCarrierError
defaultReportWebProxyCarrierError =
  ReportWebProxyCarrierError
    { carrier_id = Nothing
    , _error     = Nothing
    }

