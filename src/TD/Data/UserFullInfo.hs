module TD.Data.UserFullInfo
  (UserFullInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.BlockList as BlockList
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Birthdate as Birthdate
import qualified TD.Data.GiftSettings as GiftSettings
import qualified TD.Data.BotVerification as BotVerification
import qualified TD.Data.ProfileTab as ProfileTab
import qualified TD.Data.Audio as Audio
import qualified TD.Data.UserRating as UserRating
import qualified TD.Data.BusinessInfo as BusinessInfo
import qualified TD.Data.BotInfo as BotInfo

data UserFullInfo
  = UserFullInfo -- ^ Contains full information about a user
    { personal_photo                               :: Maybe ChatPhoto.ChatPhoto             -- ^ User profile photo set by the current user for the contact; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown. If non-null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
    , photo                                        :: Maybe ChatPhoto.ChatPhoto             -- ^ User profile photo; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown. If non-null and personal_photo is null, then it is the same photo as in user.profile_photo and chat.photo
    , public_photo                                 :: Maybe ChatPhoto.ChatPhoto             -- ^ User profile photo visible if the main photo is hidden by privacy settings; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown. If non-null and both photo and personal_photo are null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
    , block_list                                   :: Maybe BlockList.BlockList             -- ^ Block list to which the user is added; may be null if none
    , can_be_called                                :: Maybe Bool                            -- ^ True, if the user can be called
    , supports_video_calls                         :: Maybe Bool                            -- ^ True, if a video call can be created with the user
    , has_private_calls                            :: Maybe Bool                            -- ^ True, if the user can't be called due to their privacy settings
    , has_private_forwards                         :: Maybe Bool                            -- ^ True, if the user can't be linked in forwarded messages due to their privacy settings
    , has_restricted_voice_and_video_note_messages :: Maybe Bool                            -- ^ True, if voice and video notes can't be sent or forwarded to the user
    , has_posted_to_profile_stories                :: Maybe Bool                            -- ^ True, if the user has posted to profile stories
    , has_sponsored_messages_enabled               :: Maybe Bool                            -- ^ True, if the user always enabled sponsored messages; known only for the current user
    , need_phone_number_privacy_exception          :: Maybe Bool                            -- ^ True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
    , set_chat_background                          :: Maybe Bool                            -- ^ True, if the user set chat background for both chat users and it wasn't reverted yet
    , bio                                          :: Maybe FormattedText.FormattedText     -- ^ A short user bio; may be null for bots
    , birthdate                                    :: Maybe Birthdate.Birthdate             -- ^ Birthdate of the user; may be null if unknown
    , personal_chat_id                             :: Maybe Int                             -- ^ Identifier of the personal chat of the user; 0 if none
    , gift_count                                   :: Maybe Int                             -- ^ Number of saved to profile gifts for other users or the total number of received gifts for the current user
    , group_in_common_count                        :: Maybe Int                             -- ^ Number of group chats where both the other user and the current user are a member; 0 for the current user
    , incoming_paid_message_star_count             :: Maybe Int                             -- ^ Number of Telegram Stars that must be paid by the user for each sent message to the current user
    , outgoing_paid_message_star_count             :: Maybe Int                             -- ^ Number of Telegram Stars that must be paid by the current user for each sent message to the user
    , gift_settings                                :: Maybe GiftSettings.GiftSettings       -- ^ Settings for gift receiving for the user
    , bot_verification                             :: Maybe BotVerification.BotVerification -- ^ Information about verification status of the user provided by a bot; may be null if none or unknown
    , main_profile_tab                             :: Maybe ProfileTab.ProfileTab           -- ^ The main tab chosen by the user; may be null if not chosen manually
    , first_profile_audio                          :: Maybe Audio.Audio                     -- ^ The first audio file added to the user's profile; may be null if none
    , rating                                       :: Maybe UserRating.UserRating           -- ^ The current rating of the user; may be null if none
    , pending_rating                               :: Maybe UserRating.UserRating           -- ^ The rating of the user after the next change; may be null if the user isn't the current user or there are no pending rating changes
    , pending_rating_date                          :: Maybe Int                             -- ^ Unix timestamp when rating of the user will change to pending_rating; 0 if the user isn't the current user or there are no pending rating changes
    , note                                         :: Maybe FormattedText.FormattedText     -- ^ Note added to the user's contact; may be null if none
    , business_info                                :: Maybe BusinessInfo.BusinessInfo       -- ^ Information about business settings for Telegram Business accounts; may be null if none
    , bot_info                                     :: Maybe BotInfo.BotInfo                 -- ^ For bots, information about the bot; may be null if the user isn't a bot
    }
  deriving (Eq, Show)

instance I.ShortShow UserFullInfo where
  shortShow UserFullInfo
    { personal_photo                               = personal_photo_
    , photo                                        = photo_
    , public_photo                                 = public_photo_
    , block_list                                   = block_list_
    , can_be_called                                = can_be_called_
    , supports_video_calls                         = supports_video_calls_
    , has_private_calls                            = has_private_calls_
    , has_private_forwards                         = has_private_forwards_
    , has_restricted_voice_and_video_note_messages = has_restricted_voice_and_video_note_messages_
    , has_posted_to_profile_stories                = has_posted_to_profile_stories_
    , has_sponsored_messages_enabled               = has_sponsored_messages_enabled_
    , need_phone_number_privacy_exception          = need_phone_number_privacy_exception_
    , set_chat_background                          = set_chat_background_
    , bio                                          = bio_
    , birthdate                                    = birthdate_
    , personal_chat_id                             = personal_chat_id_
    , gift_count                                   = gift_count_
    , group_in_common_count                        = group_in_common_count_
    , incoming_paid_message_star_count             = incoming_paid_message_star_count_
    , outgoing_paid_message_star_count             = outgoing_paid_message_star_count_
    , gift_settings                                = gift_settings_
    , bot_verification                             = bot_verification_
    , main_profile_tab                             = main_profile_tab_
    , first_profile_audio                          = first_profile_audio_
    , rating                                       = rating_
    , pending_rating                               = pending_rating_
    , pending_rating_date                          = pending_rating_date_
    , note                                         = note_
    , business_info                                = business_info_
    , bot_info                                     = bot_info_
    }
      = "UserFullInfo"
        ++ I.cc
        [ "personal_photo"                               `I.p` personal_photo_
        , "photo"                                        `I.p` photo_
        , "public_photo"                                 `I.p` public_photo_
        , "block_list"                                   `I.p` block_list_
        , "can_be_called"                                `I.p` can_be_called_
        , "supports_video_calls"                         `I.p` supports_video_calls_
        , "has_private_calls"                            `I.p` has_private_calls_
        , "has_private_forwards"                         `I.p` has_private_forwards_
        , "has_restricted_voice_and_video_note_messages" `I.p` has_restricted_voice_and_video_note_messages_
        , "has_posted_to_profile_stories"                `I.p` has_posted_to_profile_stories_
        , "has_sponsored_messages_enabled"               `I.p` has_sponsored_messages_enabled_
        , "need_phone_number_privacy_exception"          `I.p` need_phone_number_privacy_exception_
        , "set_chat_background"                          `I.p` set_chat_background_
        , "bio"                                          `I.p` bio_
        , "birthdate"                                    `I.p` birthdate_
        , "personal_chat_id"                             `I.p` personal_chat_id_
        , "gift_count"                                   `I.p` gift_count_
        , "group_in_common_count"                        `I.p` group_in_common_count_
        , "incoming_paid_message_star_count"             `I.p` incoming_paid_message_star_count_
        , "outgoing_paid_message_star_count"             `I.p` outgoing_paid_message_star_count_
        , "gift_settings"                                `I.p` gift_settings_
        , "bot_verification"                             `I.p` bot_verification_
        , "main_profile_tab"                             `I.p` main_profile_tab_
        , "first_profile_audio"                          `I.p` first_profile_audio_
        , "rating"                                       `I.p` rating_
        , "pending_rating"                               `I.p` pending_rating_
        , "pending_rating_date"                          `I.p` pending_rating_date_
        , "note"                                         `I.p` note_
        , "business_info"                                `I.p` business_info_
        , "bot_info"                                     `I.p` bot_info_
        ]

instance AT.FromJSON UserFullInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userFullInfo" -> parseUserFullInfo v
      _              -> mempty
    
    where
      parseUserFullInfo :: A.Value -> AT.Parser UserFullInfo
      parseUserFullInfo = A.withObject "UserFullInfo" $ \o -> do
        personal_photo_                               <- o A..:?  "personal_photo"
        photo_                                        <- o A..:?  "photo"
        public_photo_                                 <- o A..:?  "public_photo"
        block_list_                                   <- o A..:?  "block_list"
        can_be_called_                                <- o A..:?  "can_be_called"
        supports_video_calls_                         <- o A..:?  "supports_video_calls"
        has_private_calls_                            <- o A..:?  "has_private_calls"
        has_private_forwards_                         <- o A..:?  "has_private_forwards"
        has_restricted_voice_and_video_note_messages_ <- o A..:?  "has_restricted_voice_and_video_note_messages"
        has_posted_to_profile_stories_                <- o A..:?  "has_posted_to_profile_stories"
        has_sponsored_messages_enabled_               <- o A..:?  "has_sponsored_messages_enabled"
        need_phone_number_privacy_exception_          <- o A..:?  "need_phone_number_privacy_exception"
        set_chat_background_                          <- o A..:?  "set_chat_background"
        bio_                                          <- o A..:?  "bio"
        birthdate_                                    <- o A..:?  "birthdate"
        personal_chat_id_                             <- o A..:?  "personal_chat_id"
        gift_count_                                   <- o A..:?  "gift_count"
        group_in_common_count_                        <- o A..:?  "group_in_common_count"
        incoming_paid_message_star_count_             <- o A..:?  "incoming_paid_message_star_count"
        outgoing_paid_message_star_count_             <- o A..:?  "outgoing_paid_message_star_count"
        gift_settings_                                <- o A..:?  "gift_settings"
        bot_verification_                             <- o A..:?  "bot_verification"
        main_profile_tab_                             <- o A..:?  "main_profile_tab"
        first_profile_audio_                          <- o A..:?  "first_profile_audio"
        rating_                                       <- o A..:?  "rating"
        pending_rating_                               <- o A..:?  "pending_rating"
        pending_rating_date_                          <- o A..:?  "pending_rating_date"
        note_                                         <- o A..:?  "note"
        business_info_                                <- o A..:?  "business_info"
        bot_info_                                     <- o A..:?  "bot_info"
        pure $ UserFullInfo
          { personal_photo                               = personal_photo_
          , photo                                        = photo_
          , public_photo                                 = public_photo_
          , block_list                                   = block_list_
          , can_be_called                                = can_be_called_
          , supports_video_calls                         = supports_video_calls_
          , has_private_calls                            = has_private_calls_
          , has_private_forwards                         = has_private_forwards_
          , has_restricted_voice_and_video_note_messages = has_restricted_voice_and_video_note_messages_
          , has_posted_to_profile_stories                = has_posted_to_profile_stories_
          , has_sponsored_messages_enabled               = has_sponsored_messages_enabled_
          , need_phone_number_privacy_exception          = need_phone_number_privacy_exception_
          , set_chat_background                          = set_chat_background_
          , bio                                          = bio_
          , birthdate                                    = birthdate_
          , personal_chat_id                             = personal_chat_id_
          , gift_count                                   = gift_count_
          , group_in_common_count                        = group_in_common_count_
          , incoming_paid_message_star_count             = incoming_paid_message_star_count_
          , outgoing_paid_message_star_count             = outgoing_paid_message_star_count_
          , gift_settings                                = gift_settings_
          , bot_verification                             = bot_verification_
          , main_profile_tab                             = main_profile_tab_
          , first_profile_audio                          = first_profile_audio_
          , rating                                       = rating_
          , pending_rating                               = pending_rating_
          , pending_rating_date                          = pending_rating_date_
          , note                                         = note_
          , business_info                                = business_info_
          , bot_info                                     = bot_info_
          }
  parseJSON _ = mempty

