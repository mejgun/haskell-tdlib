module TD.Query.ReportAuthenticationCodeMissing
  (ReportAuthenticationCodeMissing(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Reports that authentication code wasn't delivered via SMS; for official mobile applications only. Works only when the current authorization state is authorizationStateWaitCode. Returns 'TD.Data.Ok.Ok'
data ReportAuthenticationCodeMissing
  = ReportAuthenticationCodeMissing
    { mobile_network_code :: Maybe T.Text -- ^ Current mobile network code
    }
  deriving (Eq, Show)

instance I.ShortShow ReportAuthenticationCodeMissing where
  shortShow
    ReportAuthenticationCodeMissing
      { mobile_network_code = mobile_network_code_
      }
        = "ReportAuthenticationCodeMissing"
          ++ I.cc
          [ "mobile_network_code" `I.p` mobile_network_code_
          ]

instance AT.ToJSON ReportAuthenticationCodeMissing where
  toJSON
    ReportAuthenticationCodeMissing
      { mobile_network_code = mobile_network_code_
      }
        = A.object
          [ "@type"               A..= AT.String "reportAuthenticationCodeMissing"
          , "mobile_network_code" A..= mobile_network_code_
          ]

