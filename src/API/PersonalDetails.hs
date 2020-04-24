-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PersonalDetails where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Date as Date

data PersonalDetails = 
 PersonalDetails { residence_country_code :: Maybe String, country_code :: Maybe String, gender :: Maybe String, birthdate :: Maybe Date.Date, native_last_name :: Maybe String, native_middle_name :: Maybe String, native_first_name :: Maybe String, last_name :: Maybe String, middle_name :: Maybe String, first_name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON PersonalDetails where
 toJSON (PersonalDetails { residence_country_code = residence_country_code, country_code = country_code, gender = gender, birthdate = birthdate, native_last_name = native_last_name, native_middle_name = native_middle_name, native_first_name = native_first_name, last_name = last_name, middle_name = middle_name, first_name = first_name }) =
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
    residence_country_code <- optional $ o A..: "residence_country_code"
    country_code <- optional $ o A..: "country_code"
    gender <- optional $ o A..: "gender"
    birthdate <- optional $ o A..: "birthdate"
    native_last_name <- optional $ o A..: "native_last_name"
    native_middle_name <- optional $ o A..: "native_middle_name"
    native_first_name <- optional $ o A..: "native_first_name"
    last_name <- optional $ o A..: "last_name"
    middle_name <- optional $ o A..: "middle_name"
    first_name <- optional $ o A..: "first_name"
    return $ PersonalDetails { residence_country_code = residence_country_code, country_code = country_code, gender = gender, birthdate = birthdate, native_last_name = native_last_name, native_middle_name = native_middle_name, native_first_name = native_first_name, last_name = last_name, middle_name = middle_name, first_name = first_name }