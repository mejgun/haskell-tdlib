module TD.Data.User
  (User(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Usernames as Usernames
import qualified TD.Data.UserStatus as UserStatus
import qualified TD.Data.ProfilePhoto as ProfilePhoto
import qualified TD.Data.EmojiStatus as EmojiStatus
import qualified TD.Data.UserType as UserType

data User
  = User -- ^ Represents a user
    { _id                                :: Maybe Int                       -- ^ User identifier
    , first_name                         :: Maybe T.Text                    -- ^ First name of the user
    , last_name                          :: Maybe T.Text                    -- ^ Last name of the user
    , usernames                          :: Maybe Usernames.Usernames       -- ^ Usernames of the user; may be null
    , phone_number                       :: Maybe T.Text                    -- ^ Phone number of the user
    , status                             :: Maybe UserStatus.UserStatus     -- ^ Current online status of the user
    , profile_photo                      :: Maybe ProfilePhoto.ProfilePhoto -- ^ Profile photo of the user; may be null
    , accent_color_id                    :: Maybe Int                       -- ^ Identifier of the accent color for name, and backgrounds of profile photo, reply header, and link preview
    , background_custom_emoji_id         :: Maybe Int                       -- ^ Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none
    , profile_accent_color_id            :: Maybe Int                       -- ^ Identifier of the accent color for the user's profile; -1 if none
    , profile_background_custom_emoji_id :: Maybe Int                       -- ^ Identifier of a custom emoji to be shown on the background of the user's profile; 0 if none
    , emoji_status                       :: Maybe EmojiStatus.EmojiStatus   -- ^ Emoji status to be shown instead of the default Telegram Premium badge; may be null
    , is_contact                         :: Maybe Bool                      -- ^ The user is a contact of the current user
    , is_mutual_contact                  :: Maybe Bool                      -- ^ The user is a contact of the current user and the current user is a contact of the user
    , is_close_friend                    :: Maybe Bool                      -- ^ The user is a close friend of the current user; implies that the user is a contact
    , is_verified                        :: Maybe Bool                      -- ^ True, if the user is verified
    , is_premium                         :: Maybe Bool                      -- ^ True, if the user is a Telegram Premium user
    , is_support                         :: Maybe Bool                      -- ^ True, if the user is Telegram support account
    , restriction_reason                 :: Maybe T.Text                    -- ^ If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
    , is_scam                            :: Maybe Bool                      -- ^ True, if many users reported this user as a scam
    , is_fake                            :: Maybe Bool                      -- ^ True, if many users reported this user as a fake account
    , has_active_stories                 :: Maybe Bool                      -- ^ True, if the user has non-expired stories available to the current user
    , has_unread_active_stories          :: Maybe Bool                      -- ^ True, if the user has unread non-expired stories available to the current user
    , restricts_new_chats                :: Maybe Bool                      -- ^ True, if the user may restrict new chats with non-contacts. Use canSendMessageToUser to check whether the current user can message the user or try to create a chat with them
    , have_access                        :: Maybe Bool                      -- ^ If false, the user is inaccessible, and the only information known about the user is inside this class. Identifier of the user can't be passed to any method
    , _type                              :: Maybe UserType.UserType         -- ^ Type of the user
    , language_code                      :: Maybe T.Text                    -- ^ IETF language tag of the user's language; only available to bots
    , added_to_attachment_menu           :: Maybe Bool                      -- ^ True, if the user added the current bot to attachment menu; only available to bots
    }
  deriving (Eq, Show)

instance I.ShortShow User where
  shortShow User
    { _id                                = _id_
    , first_name                         = first_name_
    , last_name                          = last_name_
    , usernames                          = usernames_
    , phone_number                       = phone_number_
    , status                             = status_
    , profile_photo                      = profile_photo_
    , accent_color_id                    = accent_color_id_
    , background_custom_emoji_id         = background_custom_emoji_id_
    , profile_accent_color_id            = profile_accent_color_id_
    , profile_background_custom_emoji_id = profile_background_custom_emoji_id_
    , emoji_status                       = emoji_status_
    , is_contact                         = is_contact_
    , is_mutual_contact                  = is_mutual_contact_
    , is_close_friend                    = is_close_friend_
    , is_verified                        = is_verified_
    , is_premium                         = is_premium_
    , is_support                         = is_support_
    , restriction_reason                 = restriction_reason_
    , is_scam                            = is_scam_
    , is_fake                            = is_fake_
    , has_active_stories                 = has_active_stories_
    , has_unread_active_stories          = has_unread_active_stories_
    , restricts_new_chats                = restricts_new_chats_
    , have_access                        = have_access_
    , _type                              = _type_
    , language_code                      = language_code_
    , added_to_attachment_menu           = added_to_attachment_menu_
    }
      = "User"
        ++ I.cc
        [ "_id"                                `I.p` _id_
        , "first_name"                         `I.p` first_name_
        , "last_name"                          `I.p` last_name_
        , "usernames"                          `I.p` usernames_
        , "phone_number"                       `I.p` phone_number_
        , "status"                             `I.p` status_
        , "profile_photo"                      `I.p` profile_photo_
        , "accent_color_id"                    `I.p` accent_color_id_
        , "background_custom_emoji_id"         `I.p` background_custom_emoji_id_
        , "profile_accent_color_id"            `I.p` profile_accent_color_id_
        , "profile_background_custom_emoji_id" `I.p` profile_background_custom_emoji_id_
        , "emoji_status"                       `I.p` emoji_status_
        , "is_contact"                         `I.p` is_contact_
        , "is_mutual_contact"                  `I.p` is_mutual_contact_
        , "is_close_friend"                    `I.p` is_close_friend_
        , "is_verified"                        `I.p` is_verified_
        , "is_premium"                         `I.p` is_premium_
        , "is_support"                         `I.p` is_support_
        , "restriction_reason"                 `I.p` restriction_reason_
        , "is_scam"                            `I.p` is_scam_
        , "is_fake"                            `I.p` is_fake_
        , "has_active_stories"                 `I.p` has_active_stories_
        , "has_unread_active_stories"          `I.p` has_unread_active_stories_
        , "restricts_new_chats"                `I.p` restricts_new_chats_
        , "have_access"                        `I.p` have_access_
        , "_type"                              `I.p` _type_
        , "language_code"                      `I.p` language_code_
        , "added_to_attachment_menu"           `I.p` added_to_attachment_menu_
        ]

instance AT.FromJSON User where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "user" -> parseUser v
      _      -> mempty
    
    where
      parseUser :: A.Value -> AT.Parser User
      parseUser = A.withObject "User" $ \o -> do
        _id_                                <- o A..:?                       "id"
        first_name_                         <- o A..:?                       "first_name"
        last_name_                          <- o A..:?                       "last_name"
        usernames_                          <- o A..:?                       "usernames"
        phone_number_                       <- o A..:?                       "phone_number"
        status_                             <- o A..:?                       "status"
        profile_photo_                      <- o A..:?                       "profile_photo"
        accent_color_id_                    <- o A..:?                       "accent_color_id"
        background_custom_emoji_id_         <- fmap I.readInt64 <$> o A..:?  "background_custom_emoji_id"
        profile_accent_color_id_            <- o A..:?                       "profile_accent_color_id"
        profile_background_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "profile_background_custom_emoji_id"
        emoji_status_                       <- o A..:?                       "emoji_status"
        is_contact_                         <- o A..:?                       "is_contact"
        is_mutual_contact_                  <- o A..:?                       "is_mutual_contact"
        is_close_friend_                    <- o A..:?                       "is_close_friend"
        is_verified_                        <- o A..:?                       "is_verified"
        is_premium_                         <- o A..:?                       "is_premium"
        is_support_                         <- o A..:?                       "is_support"
        restriction_reason_                 <- o A..:?                       "restriction_reason"
        is_scam_                            <- o A..:?                       "is_scam"
        is_fake_                            <- o A..:?                       "is_fake"
        has_active_stories_                 <- o A..:?                       "has_active_stories"
        has_unread_active_stories_          <- o A..:?                       "has_unread_active_stories"
        restricts_new_chats_                <- o A..:?                       "restricts_new_chats"
        have_access_                        <- o A..:?                       "have_access"
        _type_                              <- o A..:?                       "type"
        language_code_                      <- o A..:?                       "language_code"
        added_to_attachment_menu_           <- o A..:?                       "added_to_attachment_menu"
        pure $ User
          { _id                                = _id_
          , first_name                         = first_name_
          , last_name                          = last_name_
          , usernames                          = usernames_
          , phone_number                       = phone_number_
          , status                             = status_
          , profile_photo                      = profile_photo_
          , accent_color_id                    = accent_color_id_
          , background_custom_emoji_id         = background_custom_emoji_id_
          , profile_accent_color_id            = profile_accent_color_id_
          , profile_background_custom_emoji_id = profile_background_custom_emoji_id_
          , emoji_status                       = emoji_status_
          , is_contact                         = is_contact_
          , is_mutual_contact                  = is_mutual_contact_
          , is_close_friend                    = is_close_friend_
          , is_verified                        = is_verified_
          , is_premium                         = is_premium_
          , is_support                         = is_support_
          , restriction_reason                 = restriction_reason_
          , is_scam                            = is_scam_
          , is_fake                            = is_fake_
          , has_active_stories                 = has_active_stories_
          , has_unread_active_stories          = has_unread_active_stories_
          , restricts_new_chats                = restricts_new_chats_
          , have_access                        = have_access_
          , _type                              = _type_
          , language_code                      = language_code_
          , added_to_attachment_menu           = added_to_attachment_menu_
          }
  parseJSON _ = mempty

