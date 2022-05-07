{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CheckChangePhoneNumberCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the authentication code sent to confirm a new phone number of the user @code Authentication code to check
data CheckChangePhoneNumberCode = CheckChangePhoneNumberCode
  { -- |
    code :: Maybe String
  }
  deriving (Eq)

instance Show CheckChangePhoneNumberCode where
  show
    CheckChangePhoneNumberCode
      { code = code
      } =
      "CheckChangePhoneNumberCode"
        ++ U.cc
          [ U.p "code" code
          ]

instance T.ToJSON CheckChangePhoneNumberCode where
  toJSON
    CheckChangePhoneNumberCode
      { code = code
      } =
      A.object
        [ "@type" A..= T.String "checkChangePhoneNumberCode",
          "code" A..= code
        ]
