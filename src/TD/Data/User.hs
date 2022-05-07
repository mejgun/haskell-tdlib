{-# LANGUAGE OverloadedStrings #-}

module TD.Data.User where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ProfilePhoto as ProfilePhoto
import qualified TD.Data.UserStatus as UserStatus
import qualified TD.Data.UserType as UserType
import qualified Utils as U

data User = -- | Represents a user
  User
  { -- | IETF language tag of the user's language; only available to bots
    language_code :: Maybe String,
    -- | Type of the user
    _type :: Maybe UserType.UserType,
    -- | If false, the user is inaccessible, and the only information known about the user is inside this class. Identifier of the user can't be passed to any method except GetUser
    have_access :: Maybe Bool,
    -- | True, if many users reported this user as a fake account
    is_fake :: Maybe Bool,
    -- | True, if many users reported this user as a scam
    is_scam :: Maybe Bool,
    -- | If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
    restriction_reason :: Maybe String,
    -- | True, if the user is Telegram support account
    is_support :: Maybe Bool,
    -- | True, if the user is verified
    is_verified :: Maybe Bool,
    -- | The user is a contact of the current user and the current user is a contact of the user
    is_mutual_contact :: Maybe Bool,
    -- | The user is a contact of the current user
    is_contact :: Maybe Bool,
    -- | Profile photo of the user; may be null
    profile_photo :: Maybe ProfilePhoto.ProfilePhoto,
    -- | Current online status of the user
    status :: Maybe UserStatus.UserStatus,
    -- | Phone number of the user
    phone_number :: Maybe String,
    -- | Username of the user
    username :: Maybe String,
    -- | Last name of the user
    last_name :: Maybe String,
    -- | First name of the user
    first_name :: Maybe String,
    -- | User identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show User where
  show
    User
      { language_code = language_code,
        _type = _type,
        have_access = have_access,
        is_fake = is_fake,
        is_scam = is_scam,
        restriction_reason = restriction_reason,
        is_support = is_support,
        is_verified = is_verified,
        is_mutual_contact = is_mutual_contact,
        is_contact = is_contact,
        profile_photo = profile_photo,
        status = status,
        phone_number = phone_number,
        username = username,
        last_name = last_name,
        first_name = first_name,
        _id = _id
      } =
      "User"
        ++ U.cc
          [ U.p "language_code" language_code,
            U.p "_type" _type,
            U.p "have_access" have_access,
            U.p "is_fake" is_fake,
            U.p "is_scam" is_scam,
            U.p "restriction_reason" restriction_reason,
            U.p "is_support" is_support,
            U.p "is_verified" is_verified,
            U.p "is_mutual_contact" is_mutual_contact,
            U.p "is_contact" is_contact,
            U.p "profile_photo" profile_photo,
            U.p "status" status,
            U.p "phone_number" phone_number,
            U.p "username" username,
            U.p "last_name" last_name,
            U.p "first_name" first_name,
            U.p "_id" _id
          ]

instance T.FromJSON User where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "user" -> parseUser v
      _ -> mempty
    where
      parseUser :: A.Value -> T.Parser User
      parseUser = A.withObject "User" $ \o -> do
        language_code_ <- o A..:? "language_code"
        _type_ <- o A..:? "type"
        have_access_ <- o A..:? "have_access"
        is_fake_ <- o A..:? "is_fake"
        is_scam_ <- o A..:? "is_scam"
        restriction_reason_ <- o A..:? "restriction_reason"
        is_support_ <- o A..:? "is_support"
        is_verified_ <- o A..:? "is_verified"
        is_mutual_contact_ <- o A..:? "is_mutual_contact"
        is_contact_ <- o A..:? "is_contact"
        profile_photo_ <- o A..:? "profile_photo"
        status_ <- o A..:? "status"
        phone_number_ <- o A..:? "phone_number"
        username_ <- o A..:? "username"
        last_name_ <- o A..:? "last_name"
        first_name_ <- o A..:? "first_name"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ User {language_code = language_code_, _type = _type_, have_access = have_access_, is_fake = is_fake_, is_scam = is_scam_, restriction_reason = restriction_reason_, is_support = is_support_, is_verified = is_verified_, is_mutual_contact = is_mutual_contact_, is_contact = is_contact_, profile_photo = profile_photo_, status = status_, phone_number = phone_number_, username = username_, last_name = last_name_, first_name = first_name_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON User where
  toJSON
    User
      { language_code = language_code,
        _type = _type,
        have_access = have_access,
        is_fake = is_fake,
        is_scam = is_scam,
        restriction_reason = restriction_reason,
        is_support = is_support,
        is_verified = is_verified,
        is_mutual_contact = is_mutual_contact,
        is_contact = is_contact,
        profile_photo = profile_photo,
        status = status,
        phone_number = phone_number,
        username = username,
        last_name = last_name,
        first_name = first_name,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "user",
          "language_code" A..= language_code,
          "type" A..= _type,
          "have_access" A..= have_access,
          "is_fake" A..= is_fake,
          "is_scam" A..= is_scam,
          "restriction_reason" A..= restriction_reason,
          "is_support" A..= is_support,
          "is_verified" A..= is_verified,
          "is_mutual_contact" A..= is_mutual_contact,
          "is_contact" A..= is_contact,
          "profile_photo" A..= profile_photo,
          "status" A..= status,
          "phone_number" A..= phone_number,
          "username" A..= username,
          "last_name" A..= last_name,
          "first_name" A..= first_name,
          "id" A..= _id
        ]
