{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks phone number confirmation code @code Confirmation code to check
data CheckPhoneNumberConfirmationCode = CheckPhoneNumberConfirmationCode
  { -- |
    code :: Maybe String
  }
  deriving (Eq)

instance Show CheckPhoneNumberConfirmationCode where
  show
    CheckPhoneNumberConfirmationCode
      { code = code_
      } =
      "CheckPhoneNumberConfirmationCode"
        ++ U.cc
          [ U.p "code" code_
          ]

instance T.ToJSON CheckPhoneNumberConfirmationCode where
  toJSON
    CheckPhoneNumberConfirmationCode
      { code = code_
      } =
      A.object
        [ "@type" A..= T.String "checkPhoneNumberConfirmationCode",
          "code" A..= code_
        ]
