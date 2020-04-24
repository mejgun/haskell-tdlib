-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.User where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserType as UserType
import {-# SOURCE #-} qualified API.ProfilePhoto as ProfilePhoto
import {-# SOURCE #-} qualified API.UserStatus as UserStatus

data User = 
 User { language_code :: Maybe String, _type :: Maybe UserType.UserType, have_access :: Maybe Bool, is_scam :: Maybe Bool, restriction_reason :: Maybe String, is_support :: Maybe Bool, is_verified :: Maybe Bool, is_mutual_contact :: Maybe Bool, is_contact :: Maybe Bool, profile_photo :: Maybe ProfilePhoto.ProfilePhoto, status :: Maybe UserStatus.UserStatus, phone_number :: Maybe String, username :: Maybe String, last_name :: Maybe String, first_name :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON User where
 toJSON (User { language_code = language_code, _type = _type, have_access = have_access, is_scam = is_scam, restriction_reason = restriction_reason, is_support = is_support, is_verified = is_verified, is_mutual_contact = is_mutual_contact, is_contact = is_contact, profile_photo = profile_photo, status = status, phone_number = phone_number, username = username, last_name = last_name, first_name = first_name, _id = _id }) =
  A.object [ "@type" A..= T.String "user", "language_code" A..= language_code, "type" A..= _type, "have_access" A..= have_access, "is_scam" A..= is_scam, "restriction_reason" A..= restriction_reason, "is_support" A..= is_support, "is_verified" A..= is_verified, "is_mutual_contact" A..= is_mutual_contact, "is_contact" A..= is_contact, "profile_photo" A..= profile_photo, "status" A..= status, "phone_number" A..= phone_number, "username" A..= username, "last_name" A..= last_name, "first_name" A..= first_name, "id" A..= _id ]

instance T.FromJSON User where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "user" -> parseUser v
   _ -> mempty
  where
   parseUser :: A.Value -> T.Parser User
   parseUser = A.withObject "User" $ \o -> do
    language_code <- optional $ o A..: "language_code"
    _type <- optional $ o A..: "type"
    have_access <- optional $ o A..: "have_access"
    is_scam <- optional $ o A..: "is_scam"
    restriction_reason <- optional $ o A..: "restriction_reason"
    is_support <- optional $ o A..: "is_support"
    is_verified <- optional $ o A..: "is_verified"
    is_mutual_contact <- optional $ o A..: "is_mutual_contact"
    is_contact <- optional $ o A..: "is_contact"
    profile_photo <- optional $ o A..: "profile_photo"
    status <- optional $ o A..: "status"
    phone_number <- optional $ o A..: "phone_number"
    username <- optional $ o A..: "username"
    last_name <- optional $ o A..: "last_name"
    first_name <- optional $ o A..: "first_name"
    _id <- optional $ o A..: "id"
    return $ User { language_code = language_code, _type = _type, have_access = have_access, is_scam = is_scam, restriction_reason = restriction_reason, is_support = is_support, is_verified = is_verified, is_mutual_contact = is_mutual_contact, is_contact = is_contact, profile_photo = profile_photo, status = status, phone_number = phone_number, username = username, last_name = last_name, first_name = first_name, _id = _id }