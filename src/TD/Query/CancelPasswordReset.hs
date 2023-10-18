module TD.Query.CancelPasswordReset
  (CancelPasswordReset(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Cancels reset of 2-step verification password. The method can be called if passwordState.pending_reset_date > 0. Returns 'TD.Data.Ok.Ok'
data CancelPasswordReset
  = CancelPasswordReset
  deriving (Eq, Show)

instance I.ShortShow CancelPasswordReset where
  shortShow
    CancelPasswordReset
        = "CancelPasswordReset"

instance AT.ToJSON CancelPasswordReset where
  toJSON
    CancelPasswordReset
        = A.object
          [ "@type" A..= AT.String "cancelPasswordReset"
          ]

