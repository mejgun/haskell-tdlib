module TD.Query.GetPremiumState
  (GetPremiumState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns state of Telegram Premium subscription and promotion videos for Premium features
data GetPremiumState
  = GetPremiumState
  deriving (Eq)

instance Show GetPremiumState where
  show
    GetPremiumState
        = "GetPremiumState"

instance AT.ToJSON GetPremiumState where
  toJSON
    GetPremiumState
        = A.object
          [ "@type" A..= AT.String "getPremiumState"
          ]

