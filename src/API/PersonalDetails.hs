-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PersonalDetails where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Date as Date

-- |
-- 
-- Contains the user's personal details
-- 
-- __first_name__ First name of the user written in English; 1-255 characters
-- 
-- __middle_name__ Middle name of the user written in English; 0-255 characters
-- 
-- __last_name__ Last name of the user written in English; 1-255 characters
-- 
-- __native_first_name__ Native first name of the user; 1-255 characters
-- 
-- __native_middle_name__ Native middle name of the user; 0-255 characters
-- 
-- __native_last_name__ Native last name of the user; 1-255 characters
-- 
-- __birthdate__ Birthdate of the user
-- 
-- __gender__ Gender of the user, "male" or "female"
-- 
-- __country_code__ A two-letter ISO 3166-1 alpha-2 country code of the user's country
-- 
-- __residence_country_code__ A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
data PersonalDetails = 

 PersonalDetails { residence_country_code :: Maybe String, country_code :: Maybe String, gender :: Maybe String, birthdate :: Maybe Date.Date, native_last_name :: Maybe String, native_middle_name :: Maybe String, native_first_name :: Maybe String, last_name :: Maybe String, middle_name :: Maybe String, first_name :: Maybe String }  deriving (Eq)

instance Show PersonalDetails where
 show PersonalDetails { residence_country_code=residence_country_code, country_code=country_code, gender=gender, birthdate=birthdate, native_last_name=native_last_name, native_middle_name=native_middle_name, native_first_name=native_first_name, last_name=last_name, middle_name=middle_name, first_name=first_name } =
  "PersonalDetails" ++ U.cc [U.p "residence_country_code" residence_country_code, U.p "country_code" country_code, U.p "gender" gender, U.p "birthdate" birthdate, U.p "native_last_name" native_last_name, U.p "native_middle_name" native_middle_name, U.p "native_first_name" native_first_name, U.p "last_name" last_name, U.p "middle_name" middle_name, U.p "first_name" first_name ]

instance T.ToJSON PersonalDetails where
 toJSON PersonalDetails { residence_country_code = residence_country_code, country_code = country_code, gender = gender, birthdate = birthdate, native_last_name = native_last_name, native_middle_name = native_middle_name, native_first_name = native_first_name, last_name = last_name, middle_name = middle_name, first_name = first_name } =
  A.object [ "@type" A..= T.String "personalDetails", "residence_country_code" A..= residence_country_code, "country_code" A..= country_code, "gender" A..= gender, "birthdate" A..= birthdate, "native_last_name" A..= native_last_name, "native_middle_name" A..= native_middle_name, "native_first_name" A..= native_first_name, "last_name" A..= last_name, "middle_name" A..= middle_name, "first_name" A..= first_name ]

instance T.FromJSON PersonalDetails where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "personalDetails" -> parsePersonalDetails v
   _ -> mempty
  where
   parsePersonalDetails :: A.Value -> T.Parser PersonalDetails
   parsePersonalDetails = A.withObject "PersonalDetails" $ \o -> do
    residence_country_code <- o A..:? "residence_country_code"
    country_code <- o A..:? "country_code"
    gender <- o A..:? "gender"
    birthdate <- o A..:? "birthdate"
    native_last_name <- o A..:? "native_last_name"
    native_middle_name <- o A..:? "native_middle_name"
    native_first_name <- o A..:? "native_first_name"
    last_name <- o A..:? "last_name"
    middle_name <- o A..:? "middle_name"
    first_name <- o A..:? "first_name"
    return $ PersonalDetails { residence_country_code = residence_country_code, country_code = country_code, gender = gender, birthdate = birthdate, native_last_name = native_last_name, native_middle_name = native_middle_name, native_first_name = native_first_name, last_name = last_name, middle_name = middle_name, first_name = first_name }
 parseJSON _ = mempty
