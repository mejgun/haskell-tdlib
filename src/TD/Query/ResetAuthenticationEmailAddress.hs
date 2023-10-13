module TD.Query.ResetAuthenticationEmailAddress(ResetAuthenticationEmailAddress(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ResetAuthenticationEmailAddress -- ^ Resets the login email address. May return an error with a message "TASK_ALREADY_EXISTS" if reset is still pending. Works only when the current authorization state is authorizationStateWaitEmailCode and authorization_state.can_reset_email_address == true
  = ResetAuthenticationEmailAddress
  deriving (Eq)

instance Show ResetAuthenticationEmailAddress where
  show
    ResetAuthenticationEmailAddress
        = "ResetAuthenticationEmailAddress"

instance AT.ToJSON ResetAuthenticationEmailAddress where
  toJSON
    ResetAuthenticationEmailAddress
        = A.object
          [ "@type" A..= AT.String "resetAuthenticationEmailAddress"
          ]
