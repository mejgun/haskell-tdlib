{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckLoginEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmailAddressAuthentication as EmailAddressAuthentication
import qualified Utils as U

-- |
-- Checks the login email address authentication @code Email address authentication to check
data CheckLoginEmailAddressCode = CheckLoginEmailAddressCode
  { -- |
    code :: Maybe EmailAddressAuthentication.EmailAddressAuthentication
  }
  deriving (Eq)

instance Show CheckLoginEmailAddressCode where
  show
    CheckLoginEmailAddressCode
      { code = code_
      } =
      "CheckLoginEmailAddressCode"
        ++ U.cc
          [ U.p "code" code_
          ]

instance T.ToJSON CheckLoginEmailAddressCode where
  toJSON
    CheckLoginEmailAddressCode
      { code = code_
      } =
      A.object
        [ "@type" A..= T.String "checkLoginEmailAddressCode",
          "code" A..= code_
        ]
