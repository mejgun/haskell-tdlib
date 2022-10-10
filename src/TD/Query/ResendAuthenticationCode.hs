{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResendAuthenticationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, the next_code_type of the result is not null and the server-specified timeout has passed, or when the current authorization state is authorizationStateWaitEmailCode
data ResendAuthenticationCode = ResendAuthenticationCode
  {
  }
  deriving (Eq)

instance Show ResendAuthenticationCode where
  show ResendAuthenticationCode =
    "ResendAuthenticationCode"
      ++ U.cc
        []

instance T.ToJSON ResendAuthenticationCode where
  toJSON ResendAuthenticationCode =
    A.object
      [ "@type" A..= T.String "resendAuthenticationCode"
      ]
