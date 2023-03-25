{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResetAuthenticationEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resets the login email address. May return an error with a message "TASK_ALREADY_EXISTS" if reset is still pending.
-- Works only when the current authorization state is authorizationStateWaitEmailCode and authorization_state.can_reset_email_address == true
data ResetAuthenticationEmailAddress = ResetAuthenticationEmailAddress
  {
  }
  deriving (Eq)

instance Show ResetAuthenticationEmailAddress where
  show ResetAuthenticationEmailAddress =
    "ResetAuthenticationEmailAddress"
      ++ U.cc
        []

instance T.ToJSON ResetAuthenticationEmailAddress where
  toJSON ResetAuthenticationEmailAddress =
    A.object
      [ "@type" A..= T.String "resetAuthenticationEmailAddress"
      ]
