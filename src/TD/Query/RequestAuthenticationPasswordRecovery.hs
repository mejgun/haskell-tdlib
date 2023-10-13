module TD.Query.RequestAuthenticationPasswordRecovery
  (RequestAuthenticationPasswordRecovery(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Requests to send a 2-step verification password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
data RequestAuthenticationPasswordRecovery
  = RequestAuthenticationPasswordRecovery
  deriving (Eq)

instance Show RequestAuthenticationPasswordRecovery where
  show
    RequestAuthenticationPasswordRecovery
        = "RequestAuthenticationPasswordRecovery"

instance AT.ToJSON RequestAuthenticationPasswordRecovery where
  toJSON
    RequestAuthenticationPasswordRecovery
        = A.object
          [ "@type" A..= AT.String "requestAuthenticationPasswordRecovery"
          ]

