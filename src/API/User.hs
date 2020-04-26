-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.User where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserType as UserType
import {-# SOURCE #-} qualified API.ProfilePhoto as ProfilePhoto
import {-# SOURCE #-} qualified API.UserStatus as UserStatus

-- |
-- 
-- Represents a user 
-- 
-- __id__ User identifier
-- 
-- __first_name__ First name of the user
-- 
-- __last_name__ Last name of the user
-- 
-- __username__ Username of the user
-- 
-- __phone_number__ Phone number of the user
-- 
-- __status__ Current online status of the user
-- 
-- __profile_photo__ Profile photo of the user; may be null
-- 
-- __is_contact__ The user is a contact of the current user
-- 
-- __is_mutual_contact__ The user is a contact of the current user and the current user is a contact of the user
-- 
-- __is_verified__ True, if the user is verified
-- 
-- __is_support__ True, if the user is Telegram support account
-- 
-- __restriction_reason__ If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
-- 
-- __is_scam__ True, if many users reported this user as a scam
-- 
-- __have_access__ If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser
-- 
-- __type__ Type of the user
-- 
-- __language_code__ IETF language tag of the user's language; only available to bots
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
    language_code <- o A..:? "language_code"
    _type <- o A..:? "type"
    have_access <- o A..:? "have_access"
    is_scam <- o A..:? "is_scam"
    restriction_reason <- o A..:? "restriction_reason"
    is_support <- o A..:? "is_support"
    is_verified <- o A..:? "is_verified"
    is_mutual_contact <- o A..:? "is_mutual_contact"
    is_contact <- o A..:? "is_contact"
    profile_photo <- o A..:? "profile_photo"
    status <- o A..:? "status"
    phone_number <- o A..:? "phone_number"
    username <- o A..:? "username"
    last_name <- o A..:? "last_name"
    first_name <- o A..:? "first_name"
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ User { language_code = language_code, _type = _type, have_access = have_access, is_scam = is_scam, restriction_reason = restriction_reason, is_support = is_support, is_verified = is_verified, is_mutual_contact = is_mutual_contact, is_contact = is_contact, profile_photo = profile_photo, status = status, phone_number = phone_number, username = username, last_name = last_name, first_name = first_name, _id = _id }