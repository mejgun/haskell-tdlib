module TD.Query.RequestPasswordRecovery
  (RequestPasswordRecovery(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Requests to send a 2-step verification password recovery code to an email address that was previously set up
data RequestPasswordRecovery
  = RequestPasswordRecovery
  deriving (Eq)

instance Show RequestPasswordRecovery where
  show
    RequestPasswordRecovery
        = "RequestPasswordRecovery"

instance AT.ToJSON RequestPasswordRecovery where
  toJSON
    RequestPasswordRecovery
        = A.object
          [ "@type" A..= AT.String "requestPasswordRecovery"
          ]

