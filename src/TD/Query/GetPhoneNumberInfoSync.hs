{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPhoneNumberInfoSync where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a phone number by its prefix synchronously. getCountries must be called at least once after changing localization to the specified language if properly localized country information is expected. Can be called synchronously
data GetPhoneNumberInfoSync = GetPhoneNumberInfoSync
  { -- | The phone number prefix
    phone_number_prefix :: Maybe String,
    -- | A two-letter ISO 639-1 language code for country information localization
    language_code :: Maybe String
  }
  deriving (Eq)

instance Show GetPhoneNumberInfoSync where
  show
    GetPhoneNumberInfoSync
      { phone_number_prefix = phone_number_prefix_,
        language_code = language_code_
      } =
      "GetPhoneNumberInfoSync"
        ++ U.cc
          [ U.p "phone_number_prefix" phone_number_prefix_,
            U.p "language_code" language_code_
          ]

instance T.ToJSON GetPhoneNumberInfoSync where
  toJSON
    GetPhoneNumberInfoSync
      { phone_number_prefix = phone_number_prefix_,
        language_code = language_code_
      } =
      A.object
        [ "@type" A..= T.String "getPhoneNumberInfoSync",
          "phone_number_prefix" A..= phone_number_prefix_,
          "language_code" A..= language_code_
        ]
