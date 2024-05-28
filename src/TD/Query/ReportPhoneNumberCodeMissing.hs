module TD.Query.ReportPhoneNumberCodeMissing
  (ReportPhoneNumberCodeMissing(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Reports that authentication code wasn't delivered via SMS to the specified phone number; for official mobile applications only. Returns 'TD.Data.Ok.Ok'
data ReportPhoneNumberCodeMissing
  = ReportPhoneNumberCodeMissing
    { mobile_network_code :: Maybe T.Text -- ^ Current mobile network code
    }
  deriving (Eq, Show)

instance I.ShortShow ReportPhoneNumberCodeMissing where
  shortShow
    ReportPhoneNumberCodeMissing
      { mobile_network_code = mobile_network_code_
      }
        = "ReportPhoneNumberCodeMissing"
          ++ I.cc
          [ "mobile_network_code" `I.p` mobile_network_code_
          ]

instance AT.ToJSON ReportPhoneNumberCodeMissing where
  toJSON
    ReportPhoneNumberCodeMissing
      { mobile_network_code = mobile_network_code_
      }
        = A.object
          [ "@type"               A..= AT.String "reportPhoneNumberCodeMissing"
          , "mobile_network_code" A..= mobile_network_code_
          ]

