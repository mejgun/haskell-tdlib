{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PhoneNumberInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CountryInfo as CountryInfo
import qualified Utils as U

-- |
data PhoneNumberInfo = -- | Contains information about a phone number
  PhoneNumberInfo
  { -- | The phone number without country calling code formatted accordingly to local rules. Expected digits are returned as '-', but even more digits might be entered by the user
    formatted_phone_number :: Maybe String,
    -- | The part of the phone number denoting country calling code or its part
    country_calling_code :: Maybe String,
    -- | Information about the country to which the phone number belongs; may be null
    country :: Maybe CountryInfo.CountryInfo
  }
  deriving (Eq)

instance Show PhoneNumberInfo where
  show
    PhoneNumberInfo
      { formatted_phone_number = formatted_phone_number_,
        country_calling_code = country_calling_code_,
        country = country_
      } =
      "PhoneNumberInfo"
        ++ U.cc
          [ U.p "formatted_phone_number" formatted_phone_number_,
            U.p "country_calling_code" country_calling_code_,
            U.p "country" country_
          ]

instance T.FromJSON PhoneNumberInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "phoneNumberInfo" -> parsePhoneNumberInfo v
      _ -> mempty
    where
      parsePhoneNumberInfo :: A.Value -> T.Parser PhoneNumberInfo
      parsePhoneNumberInfo = A.withObject "PhoneNumberInfo" $ \o -> do
        formatted_phone_number_ <- o A..:? "formatted_phone_number"
        country_calling_code_ <- o A..:? "country_calling_code"
        country_ <- o A..:? "country"
        return $ PhoneNumberInfo {formatted_phone_number = formatted_phone_number_, country_calling_code = country_calling_code_, country = country_}
  parseJSON _ = mempty

instance T.ToJSON PhoneNumberInfo where
  toJSON
    PhoneNumberInfo
      { formatted_phone_number = formatted_phone_number_,
        country_calling_code = country_calling_code_,
        country = country_
      } =
      A.object
        [ "@type" A..= T.String "phoneNumberInfo",
          "formatted_phone_number" A..= formatted_phone_number_,
          "country_calling_code" A..= country_calling_code_,
          "country" A..= country_
        ]
