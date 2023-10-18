module TD.Query.GetPremiumLimit
  (GetPremiumLimit(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumLimitType as PremiumLimitType

-- | Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is unknown. Returns 'TD.Data.PremiumLimit.PremiumLimit'
data GetPremiumLimit
  = GetPremiumLimit
    { limit_type :: Maybe PremiumLimitType.PremiumLimitType -- ^ Type of the limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetPremiumLimit where
  shortShow
    GetPremiumLimit
      { limit_type = limit_type_
      }
        = "GetPremiumLimit"
          ++ I.cc
          [ "limit_type" `I.p` limit_type_
          ]

instance AT.ToJSON GetPremiumLimit where
  toJSON
    GetPremiumLimit
      { limit_type = limit_type_
      }
        = A.object
          [ "@type"      A..= AT.String "getPremiumLimit"
          , "limit_type" A..= limit_type_
          ]

