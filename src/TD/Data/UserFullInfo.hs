module TD.Data.UserFullInfo
  (UserFullInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.PremiumPaymentOption as PremiumPaymentOption
import qualified TD.Data.BotInfo as BotInfo

data UserFullInfo
  = UserFullInfo -- ^ Contains full information about a user
    { personal_photo                               :: Maybe ChatPhoto.ChatPhoto                         -- ^ User profile photo set by the current user for the contact; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown. If non-null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
    , photo                                        :: Maybe ChatPhoto.ChatPhoto                         -- ^ User profile photo; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown. If non-null and personal_photo is null, then it is the same photo as in user.profile_photo and chat.photo
    , public_photo                                 :: Maybe ChatPhoto.ChatPhoto                         -- ^ User profile photo visible if the main photo is hidden by privacy settings; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown. If non-null and both photo and personal_photo are null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
    , is_blocked                                   :: Maybe Bool                                        -- ^ True, if the user is blocked by the current user
    , can_be_called                                :: Maybe Bool                                        -- ^ True, if the user can be called
    , supports_video_calls                         :: Maybe Bool                                        -- ^ True, if a video call can be created with the user
    , has_private_calls                            :: Maybe Bool                                        -- ^ True, if the user can't be called due to their privacy settings
    , has_private_forwards                         :: Maybe Bool                                        -- ^ True, if the user can't be linked in forwarded messages due to their privacy settings
    , has_restricted_voice_and_video_note_messages :: Maybe Bool                                        -- ^ True, if voice and video notes can't be sent or forwarded to the user
    , has_pinned_stories                           :: Maybe Bool                                        -- ^ True, if the user has pinned stories
    , need_phone_number_privacy_exception          :: Maybe Bool                                        -- ^ True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
    , bio                                          :: Maybe FormattedText.FormattedText                 -- ^ A short user bio; may be null for bots
    , premium_gift_options                         :: Maybe [PremiumPaymentOption.PremiumPaymentOption] -- ^ The list of available options for gifting Telegram Premium to the user
    , group_in_common_count                        :: Maybe Int                                         -- ^ Number of group chats where both the other user and the current user are a member; 0 for the current user
    , bot_info                                     :: Maybe BotInfo.BotInfo                             -- ^ For bots, information about the bot; may be null if the user isn't a bot
    }
  deriving (Eq, Show)

instance I.ShortShow UserFullInfo where
  shortShow UserFullInfo
    { personal_photo                               = personal_photo_
    , photo                                        = photo_
    , public_photo                                 = public_photo_
    , is_blocked                                   = is_blocked_
    , can_be_called                                = can_be_called_
    , supports_video_calls                         = supports_video_calls_
    , has_private_calls                            = has_private_calls_
    , has_private_forwards                         = has_private_forwards_
    , has_restricted_voice_and_video_note_messages = has_restricted_voice_and_video_note_messages_
    , has_pinned_stories                           = has_pinned_stories_
    , need_phone_number_privacy_exception          = need_phone_number_privacy_exception_
    , bio                                          = bio_
    , premium_gift_options                         = premium_gift_options_
    , group_in_common_count                        = group_in_common_count_
    , bot_info                                     = bot_info_
    }
      = "UserFullInfo"
        ++ I.cc
        [ "personal_photo"                               `I.p` personal_photo_
        , "photo"                                        `I.p` photo_
        , "public_photo"                                 `I.p` public_photo_
        , "is_blocked"                                   `I.p` is_blocked_
        , "can_be_called"                                `I.p` can_be_called_
        , "supports_video_calls"                         `I.p` supports_video_calls_
        , "has_private_calls"                            `I.p` has_private_calls_
        , "has_private_forwards"                         `I.p` has_private_forwards_
        , "has_restricted_voice_and_video_note_messages" `I.p` has_restricted_voice_and_video_note_messages_
        , "has_pinned_stories"                           `I.p` has_pinned_stories_
        , "need_phone_number_privacy_exception"          `I.p` need_phone_number_privacy_exception_
        , "bio"                                          `I.p` bio_
        , "premium_gift_options"                         `I.p` premium_gift_options_
        , "group_in_common_count"                        `I.p` group_in_common_count_
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
        is_blocked_                                   <- o A..:?  "is_blocked"
        can_be_called_                                <- o A..:?  "can_be_called"
        supports_video_calls_                         <- o A..:?  "supports_video_calls"
        has_private_calls_                            <- o A..:?  "has_private_calls"
        has_private_forwards_                         <- o A..:?  "has_private_forwards"
        has_restricted_voice_and_video_note_messages_ <- o A..:?  "has_restricted_voice_and_video_note_messages"
        has_pinned_stories_                           <- o A..:?  "has_pinned_stories"
        need_phone_number_privacy_exception_          <- o A..:?  "need_phone_number_privacy_exception"
        bio_                                          <- o A..:?  "bio"
        premium_gift_options_                         <- o A..:?  "premium_gift_options"
        group_in_common_count_                        <- o A..:?  "group_in_common_count"
        bot_info_                                     <- o A..:?  "bot_info"
        pure $ UserFullInfo
          { personal_photo                               = personal_photo_
          , photo                                        = photo_
          , public_photo                                 = public_photo_
          , is_blocked                                   = is_blocked_
          , can_be_called                                = can_be_called_
          , supports_video_calls                         = supports_video_calls_
          , has_private_calls                            = has_private_calls_
          , has_private_forwards                         = has_private_forwards_
          , has_restricted_voice_and_video_note_messages = has_restricted_voice_and_video_note_messages_
          , has_pinned_stories                           = has_pinned_stories_
          , need_phone_number_privacy_exception          = need_phone_number_privacy_exception_
          , bio                                          = bio_
          , premium_gift_options                         = premium_gift_options_
          , group_in_common_count                        = group_in_common_count_
          , bot_info                                     = bot_info_
          }
  parseJSON _ = mempty

