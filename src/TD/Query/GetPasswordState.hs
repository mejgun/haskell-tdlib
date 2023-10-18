module TD.Query.GetPasswordState
  (GetPasswordState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the current state of 2-step verification. Returns 'TD.Data.PasswordState.PasswordState'
data GetPasswordState
  = GetPasswordState
  deriving (Eq, Show)

instance I.ShortShow GetPasswordState where
  shortShow
    GetPasswordState
        = "GetPasswordState"

instance AT.ToJSON GetPasswordState where
  toJSON
    GetPasswordState
        = A.object
          [ "@type" A..= AT.String "getPasswordState"
          ]

