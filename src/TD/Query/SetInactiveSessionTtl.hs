module TD.Query.SetInactiveSessionTtl
  (SetInactiveSessionTtl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the period of inactivity after which sessions will automatically be terminated. Returns 'TD.Data.Ok.Ok'
data SetInactiveSessionTtl
  = SetInactiveSessionTtl
    { inactive_session_ttl_days :: Maybe Int -- ^ New number of days of inactivity before sessions will be automatically terminated; 1-366 days
    }
  deriving (Eq, Show)

instance I.ShortShow SetInactiveSessionTtl where
  shortShow
    SetInactiveSessionTtl
      { inactive_session_ttl_days = inactive_session_ttl_days_
      }
        = "SetInactiveSessionTtl"
          ++ I.cc
          [ "inactive_session_ttl_days" `I.p` inactive_session_ttl_days_
          ]

instance AT.ToJSON SetInactiveSessionTtl where
  toJSON
    SetInactiveSessionTtl
      { inactive_session_ttl_days = inactive_session_ttl_days_
      }
        = A.object
          [ "@type"                     A..= AT.String "setInactiveSessionTtl"
          , "inactive_session_ttl_days" A..= inactive_session_ttl_days_
          ]

