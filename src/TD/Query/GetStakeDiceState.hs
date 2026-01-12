module TD.Query.GetStakeDiceState
  (GetStakeDiceState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the current state of stake dice. Returns 'TD.Data.StakeDiceState.StakeDiceState'
data GetStakeDiceState
  = GetStakeDiceState
  deriving (Eq, Show)

instance I.ShortShow GetStakeDiceState where
  shortShow
    GetStakeDiceState
        = "GetStakeDiceState"

instance AT.ToJSON GetStakeDiceState where
  toJSON
    GetStakeDiceState
        = A.object
          [ "@type" A..= AT.String "getStakeDiceState"
          ]

