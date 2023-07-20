{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.User where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmojiStatus as EmojiStatus
import qualified TD.Data.ProfilePhoto as ProfilePhoto
import qualified TD.Data.UserStatus as UserStatus
import qualified TD.Data.UserType as UserType
import qualified TD.Data.Usernames as Usernames
import qualified Utils as U

-- |
data User = -- | Represents a user
  User
  { -- | True, if the user added the current bot to attachment menu; only available to bots
    added_to_attachment_menu :: Maybe Bool,
    -- | IETF language tag of the user's language; only available to bots
    language_code :: Maybe String,
    -- | Type of the user
    _type :: Maybe UserType.UserType,
    -- | If false, the user is inaccessible, and the only information known about the user is inside this class. Identifier of the user can't be passed to any method
    have_access :: Maybe Bool,
    -- | True, if the user has unread non-expired stories available to the current user
    has_unread_active_stories :: Maybe Bool,
    -- | True, if the user has non-expired stories available to the current user
    has_active_stories :: Maybe Bool,
    -- | True, if many users reported this user as a fake account
    is_fake :: Maybe Bool,
    -- | True, if many users reported this user as a scam
    is_scam :: Maybe Bool,
    -- | If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
    restriction_reason :: Maybe String,
    -- | True, if the user is Telegram support account
    is_support :: Maybe Bool,
    -- | True, if the user is a Telegram Premium user
    is_premium :: Maybe Bool,
    -- | True, if the user is verified
    is_verified :: Maybe Bool,
    -- | The user is a close friend of the current user; implies that the user is a contact
    is_close_friend :: Maybe Bool,
    -- | The user is a contact of the current user and the current user is a contact of the user
    is_mutual_contact :: Maybe Bool,
    -- | The user is a contact of the current user
    is_contact :: Maybe Bool,
    -- | Emoji status to be shown instead of the default Telegram Premium badge; may be null. For Telegram Premium users only
    emoji_status :: Maybe EmojiStatus.EmojiStatus,
    -- | Profile photo of the user; may be null
    profile_photo :: Maybe ProfilePhoto.ProfilePhoto,
    -- | Current online status of the user
    status :: Maybe UserStatus.UserStatus,
    -- | Phone number of the user
    phone_number :: Maybe String,
    -- | Usernames of the user; may be null
    usernames :: Maybe Usernames.Usernames,
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
      { added_to_attachment_menu = added_to_attachment_menu_,
        language_code = language_code_,
        _type = _type_,
        have_access = have_access_,
        has_unread_active_stories = has_unread_active_stories_,
        has_active_stories = has_active_stories_,
        is_fake = is_fake_,
        is_scam = is_scam_,
        restriction_reason = restriction_reason_,
        is_support = is_support_,
        is_premium = is_premium_,
        is_verified = is_verified_,
        is_close_friend = is_close_friend_,
        is_mutual_contact = is_mutual_contact_,
        is_contact = is_contact_,
        emoji_status = emoji_status_,
        profile_photo = profile_photo_,
        status = status_,
        phone_number = phone_number_,
        usernames = usernames_,
        last_name = last_name_,
        first_name = first_name_,
        _id = _id_
      } =
      "User"
        ++ U.cc
          [ U.p "added_to_attachment_menu" added_to_attachment_menu_,
            U.p "language_code" language_code_,
            U.p "_type" _type_,
            U.p "have_access" have_access_,
            U.p "has_unread_active_stories" has_unread_active_stories_,
            U.p "has_active_stories" has_active_stories_,
            U.p "is_fake" is_fake_,
            U.p "is_scam" is_scam_,
            U.p "restriction_reason" restriction_reason_,
            U.p "is_support" is_support_,
            U.p "is_premium" is_premium_,
            U.p "is_verified" is_verified_,
            U.p "is_close_friend" is_close_friend_,
            U.p "is_mutual_contact" is_mutual_contact_,
            U.p "is_contact" is_contact_,
            U.p "emoji_status" emoji_status_,
            U.p "profile_photo" profile_photo_,
            U.p "status" status_,
            U.p "phone_number" phone_number_,
            U.p "usernames" usernames_,
            U.p "last_name" last_name_,
            U.p "first_name" first_name_,
            U.p "_id" _id_
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
        added_to_attachment_menu_ <- o A..:? "added_to_attachment_menu"
        language_code_ <- o A..:? "language_code"
        _type_ <- o A..:? "type"
        have_access_ <- o A..:? "have_access"
        has_unread_active_stories_ <- o A..:? "has_unread_active_stories"
        has_active_stories_ <- o A..:? "has_active_stories"
        is_fake_ <- o A..:? "is_fake"
        is_scam_ <- o A..:? "is_scam"
        restriction_reason_ <- o A..:? "restriction_reason"
        is_support_ <- o A..:? "is_support"
        is_premium_ <- o A..:? "is_premium"
        is_verified_ <- o A..:? "is_verified"
        is_close_friend_ <- o A..:? "is_close_friend"
        is_mutual_contact_ <- o A..:? "is_mutual_contact"
        is_contact_ <- o A..:? "is_contact"
        emoji_status_ <- o A..:? "emoji_status"
        profile_photo_ <- o A..:? "profile_photo"
        status_ <- o A..:? "status"
        phone_number_ <- o A..:? "phone_number"
        usernames_ <- o A..:? "usernames"
        last_name_ <- o A..:? "last_name"
        first_name_ <- o A..:? "first_name"
        _id_ <- o A..:? "id"
        return $ User {added_to_attachment_menu = added_to_attachment_menu_, language_code = language_code_, _type = _type_, have_access = have_access_, has_unread_active_stories = has_unread_active_stories_, has_active_stories = has_active_stories_, is_fake = is_fake_, is_scam = is_scam_, restriction_reason = restriction_reason_, is_support = is_support_, is_premium = is_premium_, is_verified = is_verified_, is_close_friend = is_close_friend_, is_mutual_contact = is_mutual_contact_, is_contact = is_contact_, emoji_status = emoji_status_, profile_photo = profile_photo_, status = status_, phone_number = phone_number_, usernames = usernames_, last_name = last_name_, first_name = first_name_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON User where
  toJSON
    User
      { added_to_attachment_menu = added_to_attachment_menu_,
        language_code = language_code_,
        _type = _type_,
        have_access = have_access_,
        has_unread_active_stories = has_unread_active_stories_,
        has_active_stories = has_active_stories_,
        is_fake = is_fake_,
        is_scam = is_scam_,
        restriction_reason = restriction_reason_,
        is_support = is_support_,
        is_premium = is_premium_,
        is_verified = is_verified_,
        is_close_friend = is_close_friend_,
        is_mutual_contact = is_mutual_contact_,
        is_contact = is_contact_,
        emoji_status = emoji_status_,
        profile_photo = profile_photo_,
        status = status_,
        phone_number = phone_number_,
        usernames = usernames_,
        last_name = last_name_,
        first_name = first_name_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "user",
          "added_to_attachment_menu" A..= added_to_attachment_menu_,
          "language_code" A..= language_code_,
          "type" A..= _type_,
          "have_access" A..= have_access_,
          "has_unread_active_stories" A..= has_unread_active_stories_,
          "has_active_stories" A..= has_active_stories_,
          "is_fake" A..= is_fake_,
          "is_scam" A..= is_scam_,
          "restriction_reason" A..= restriction_reason_,
          "is_support" A..= is_support_,
          "is_premium" A..= is_premium_,
          "is_verified" A..= is_verified_,
          "is_close_friend" A..= is_close_friend_,
          "is_mutual_contact" A..= is_mutual_contact_,
          "is_contact" A..= is_contact_,
          "emoji_status" A..= emoji_status_,
          "profile_photo" A..= profile_photo_,
          "status" A..= status_,
          "phone_number" A..= phone_number_,
          "usernames" A..= usernames_,
          "last_name" A..= last_name_,
          "first_name" A..= first_name_,
          "id" A..= _id_
        ]
