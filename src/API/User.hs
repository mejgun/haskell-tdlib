-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.User where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserType as UserType
import {-# SOURCE #-} qualified API.ProfilePhoto as ProfilePhoto
import {-# SOURCE #-} qualified API.UserStatus as UserStatus

--main = putStrLn "ok"

data User = 
 User { language_code :: String, _type :: UserType.UserType, have_access :: Bool, is_scam :: Bool, restriction_reason :: String, is_support :: Bool, is_verified :: Bool, is_mutual_contact :: Bool, is_contact :: Bool, profile_photo :: ProfilePhoto.ProfilePhoto, status :: UserStatus.UserStatus, phone_number :: String, username :: String, last_name :: String, first_name :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON User where
 toJSON (User { language_code = language_code, _type = _type, have_access = have_access, is_scam = is_scam, restriction_reason = restriction_reason, is_support = is_support, is_verified = is_verified, is_mutual_contact = is_mutual_contact, is_contact = is_contact, profile_photo = profile_photo, status = status, phone_number = phone_number, username = username, last_name = last_name, first_name = first_name, _id = _id }) =
  A.object [ "@type" A..= T.String "user", "language_code" A..= language_code, "type" A..= _type, "have_access" A..= have_access, "is_scam" A..= is_scam, "restriction_reason" A..= restriction_reason, "is_support" A..= is_support, "is_verified" A..= is_verified, "is_mutual_contact" A..= is_mutual_contact, "is_contact" A..= is_contact, "profile_photo" A..= profile_photo, "status" A..= status, "phone_number" A..= phone_number, "username" A..= username, "last_name" A..= last_name, "first_name" A..= first_name, "id" A..= _id ]
-- user User  { language_code :: String, _type :: UserType.UserType, have_access :: Bool, is_scam :: Bool, restriction_reason :: String, is_support :: Bool, is_verified :: Bool, is_mutual_contact :: Bool, is_contact :: Bool, profile_photo :: ProfilePhoto.ProfilePhoto, status :: UserStatus.UserStatus, phone_number :: String, username :: String, last_name :: String, first_name :: String, _id :: Int } 

