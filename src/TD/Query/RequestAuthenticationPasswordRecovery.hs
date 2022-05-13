{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RequestAuthenticationPasswordRecovery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Requests to send a password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
data RequestAuthenticationPasswordRecovery = RequestAuthenticationPasswordRecovery
  {
  }
  deriving (Eq)

instance Show RequestAuthenticationPasswordRecovery where
  show RequestAuthenticationPasswordRecovery =
    "RequestAuthenticationPasswordRecovery"
      ++ U.cc
        []

instance T.ToJSON RequestAuthenticationPasswordRecovery where
  toJSON RequestAuthenticationPasswordRecovery =
    A.object
      [ "@type" A..= T.String "requestAuthenticationPasswordRecovery"
      ]
