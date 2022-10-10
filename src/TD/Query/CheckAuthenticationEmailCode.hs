{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckAuthenticationEmailCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmailAddressAuthentication as EmailAddressAuthentication
import qualified Utils as U

-- |
-- Checks the authentication of a email address. Works only when the current authorization state is authorizationStateWaitEmailCode @code Email address authentication to check
data CheckAuthenticationEmailCode = CheckAuthenticationEmailCode
  { -- |
    code :: Maybe EmailAddressAuthentication.EmailAddressAuthentication
  }
  deriving (Eq)

instance Show CheckAuthenticationEmailCode where
  show
    CheckAuthenticationEmailCode
      { code = code_
      } =
      "CheckAuthenticationEmailCode"
        ++ U.cc
          [ U.p "code" code_
          ]

instance T.ToJSON CheckAuthenticationEmailCode where
  toJSON
    CheckAuthenticationEmailCode
      { code = code_
      } =
      A.object
        [ "@type" A..= T.String "checkAuthenticationEmailCode",
          "code" A..= code_
        ]
