module TD.Query.RequestPasswordRecovery
  (RequestPasswordRecovery(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Requests to send a 2-step verification password recovery code to an email address that was previously set up. Returns 'TD.Data.EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo'
data RequestPasswordRecovery
  = RequestPasswordRecovery
  deriving (Eq, Show)

instance I.ShortShow RequestPasswordRecovery where
  shortShow
    RequestPasswordRecovery
        = "RequestPasswordRecovery"

instance AT.ToJSON RequestPasswordRecovery where
  toJSON
    RequestPasswordRecovery
        = A.object
          [ "@type" A..= AT.String "requestPasswordRecovery"
          ]

