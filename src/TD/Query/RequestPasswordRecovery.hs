{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RequestPasswordRecovery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Requests to send a 2-step verification password recovery code to an email address that was previously set up
data RequestPasswordRecovery = RequestPasswordRecovery
  {
  }
  deriving (Eq)

instance Show RequestPasswordRecovery where
  show RequestPasswordRecovery =
    "RequestPasswordRecovery"
      ++ U.cc
        []

instance T.ToJSON RequestPasswordRecovery where
  toJSON RequestPasswordRecovery =
    A.object
      [ "@type" A..= T.String "requestPasswordRecovery"
      ]
