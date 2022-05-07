{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetPhoneNumberInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a phone number by its prefix. Can be called before authorization @phone_number_prefix The phone number prefix
data GetPhoneNumberInfo = GetPhoneNumberInfo
  { -- |
    phone_number_prefix :: Maybe String
  }
  deriving (Eq)

instance Show GetPhoneNumberInfo where
  show
    GetPhoneNumberInfo
      { phone_number_prefix = phone_number_prefix
      } =
      "GetPhoneNumberInfo"
        ++ U.cc
          [ U.p "phone_number_prefix" phone_number_prefix
          ]

instance T.ToJSON GetPhoneNumberInfo where
  toJSON
    GetPhoneNumberInfo
      { phone_number_prefix = phone_number_prefix
      } =
      A.object
        [ "@type" A..= T.String "getPhoneNumberInfo",
          "phone_number_prefix" A..= phone_number_prefix
        ]
