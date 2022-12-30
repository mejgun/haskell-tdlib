{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PersonalDetails where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Date as Date
import qualified Utils as U

-- |
data PersonalDetails = -- | Contains the user's personal details
  PersonalDetails
  { -- | A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
    residence_country_code :: Maybe String,
    -- | A two-letter ISO 3166-1 alpha-2 country code of the user's country
    country_code :: Maybe String,
    -- | Gender of the user, "male" or "female"
    gender :: Maybe String,
    -- | Birthdate of the user
    birthdate :: Maybe Date.Date,
    -- | Native last name of the user; 1-255 characters
    native_last_name :: Maybe String,
    -- | Native middle name of the user; 0-255 characters
    native_middle_name :: Maybe String,
    -- | Native first name of the user; 1-255 characters
    native_first_name :: Maybe String,
    -- | Last name of the user written in English; 1-255 characters
    last_name :: Maybe String,
    -- | Middle name of the user written in English; 0-255 characters
    middle_name :: Maybe String,
    -- | First name of the user written in English; 1-255 characters
    first_name :: Maybe String
  }
  deriving (Eq)

instance Show PersonalDetails where
  show
    PersonalDetails
      { residence_country_code = residence_country_code_,
        country_code = country_code_,
        gender = gender_,
        birthdate = birthdate_,
        native_last_name = native_last_name_,
        native_middle_name = native_middle_name_,
        native_first_name = native_first_name_,
        last_name = last_name_,
        middle_name = middle_name_,
        first_name = first_name_
      } =
      "PersonalDetails"
        ++ U.cc
          [ U.p "residence_country_code" residence_country_code_,
            U.p "country_code" country_code_,
            U.p "gender" gender_,
            U.p "birthdate" birthdate_,
            U.p "native_last_name" native_last_name_,
            U.p "native_middle_name" native_middle_name_,
            U.p "native_first_name" native_first_name_,
            U.p "last_name" last_name_,
            U.p "middle_name" middle_name_,
            U.p "first_name" first_name_
          ]

instance T.FromJSON PersonalDetails where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "personalDetails" -> parsePersonalDetails v
      _ -> mempty
    where
      parsePersonalDetails :: A.Value -> T.Parser PersonalDetails
      parsePersonalDetails = A.withObject "PersonalDetails" $ \o -> do
        residence_country_code_ <- o A..:? "residence_country_code"
        country_code_ <- o A..:? "country_code"
        gender_ <- o A..:? "gender"
        birthdate_ <- o A..:? "birthdate"
        native_last_name_ <- o A..:? "native_last_name"
        native_middle_name_ <- o A..:? "native_middle_name"
        native_first_name_ <- o A..:? "native_first_name"
        last_name_ <- o A..:? "last_name"
        middle_name_ <- o A..:? "middle_name"
        first_name_ <- o A..:? "first_name"
        return $ PersonalDetails {residence_country_code = residence_country_code_, country_code = country_code_, gender = gender_, birthdate = birthdate_, native_last_name = native_last_name_, native_middle_name = native_middle_name_, native_first_name = native_first_name_, last_name = last_name_, middle_name = middle_name_, first_name = first_name_}
  parseJSON _ = mempty

instance T.ToJSON PersonalDetails where
  toJSON
    PersonalDetails
      { residence_country_code = residence_country_code_,
        country_code = country_code_,
        gender = gender_,
        birthdate = birthdate_,
        native_last_name = native_last_name_,
        native_middle_name = native_middle_name_,
        native_first_name = native_first_name_,
        last_name = last_name_,
        middle_name = middle_name_,
        first_name = first_name_
      } =
      A.object
        [ "@type" A..= T.String "personalDetails",
          "residence_country_code" A..= residence_country_code_,
          "country_code" A..= country_code_,
          "gender" A..= gender_,
          "birthdate" A..= birthdate_,
          "native_last_name" A..= native_last_name_,
          "native_middle_name" A..= native_middle_name_,
          "native_first_name" A..= native_first_name_,
          "last_name" A..= last_name_,
          "middle_name" A..= middle_name_,
          "first_name" A..= first_name_
        ]
