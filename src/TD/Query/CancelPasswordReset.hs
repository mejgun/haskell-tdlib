module TD.Query.CancelPasswordReset where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CancelPasswordReset -- ^ Cancels reset of 2-step verification password. The method can be called if passwordState.pending_reset_date > 0
  = CancelPasswordReset
  deriving (Eq)

instance Show CancelPasswordReset where
  show
    CancelPasswordReset
        = "CancelPasswordReset"

instance AT.ToJSON CancelPasswordReset where
  toJSON
    CancelPasswordReset
        = A.object
          [ "@type" A..= AT.String "cancelPasswordReset"
          ]
