-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PersonalDetails where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Date as Date

--main = putStrLn "ok"

data PersonalDetails = 
 PersonalDetails { residence_country_code :: String, country_code :: String, gender :: String, birthdate :: Date.Date, native_last_name :: String, native_middle_name :: String, native_first_name :: String, last_name :: String, middle_name :: String, first_name :: String }  -- deriving (Show)

instance T.ToJSON PersonalDetails where
 toJSON (PersonalDetails { residence_country_code = residence_country_code, country_code = country_code, gender = gender, birthdate = birthdate, native_last_name = native_last_name, native_middle_name = native_middle_name, native_first_name = native_first_name, last_name = last_name, middle_name = middle_name, first_name = first_name }) =
  A.object [ "@type" A..= T.String "personalDetails", "residence_country_code" A..= residence_country_code, "country_code" A..= country_code, "gender" A..= gender, "birthdate" A..= birthdate, "native_last_name" A..= native_last_name, "native_middle_name" A..= native_middle_name, "native_first_name" A..= native_first_name, "last_name" A..= last_name, "middle_name" A..= middle_name, "first_name" A..= first_name ]
-- personalDetails PersonalDetails  { residence_country_code :: String, country_code :: String, gender :: String, birthdate :: Date.Date, native_last_name :: String, native_middle_name :: String, native_first_name :: String, last_name :: String, middle_name :: String, first_name :: String } 

