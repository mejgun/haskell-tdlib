module TD.Query.GetPremiumState
  (GetPremiumState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns state of Telegram Premium subscription and promotion videos for Premium features. Returns 'TD.Data.PremiumState.PremiumState'
data GetPremiumState
  = GetPremiumState
  deriving (Eq, Show)

instance I.ShortShow GetPremiumState where
  shortShow
    GetPremiumState
        = "GetPremiumState"

instance AT.ToJSON GetPremiumState where
  toJSON
    GetPremiumState
        = A.object
          [ "@type" A..= AT.String "getPremiumState"
          ]

