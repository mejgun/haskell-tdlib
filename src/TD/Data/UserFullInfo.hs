{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UserFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotInfo as BotInfo
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.PremiumGiftOption as PremiumGiftOption
import qualified Utils as U

-- |
data UserFullInfo = -- | Contains full information about a user
  UserFullInfo
  { -- | For bots, information about the bot; may be null
    bot_info :: Maybe BotInfo.BotInfo,
    -- | Number of group chats where both the other user and the current user are a member; 0 for the current user
    group_in_common_count :: Maybe Int,
    -- | The list of available options for gifting Telegram Premium to the user
    premium_gift_options :: Maybe [PremiumGiftOption.PremiumGiftOption],
    -- | A short user bio; may be null for bots
    bio :: Maybe FormattedText.FormattedText,
    -- | True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
    need_phone_number_privacy_exception :: Maybe Bool,
    -- | True, if voice and video notes can't be sent or forwarded to the user
    has_restricted_voice_and_video_note_messages :: Maybe Bool,
    -- | True, if the user can't be linked in forwarded messages due to their privacy settings
    has_private_forwards :: Maybe Bool,
    -- | True, if the user can't be called due to their privacy settings
    has_private_calls :: Maybe Bool,
    -- | True, if a video call can be created with the user
    supports_video_calls :: Maybe Bool,
    -- | True, if the user can be called
    can_be_called :: Maybe Bool,
    -- | True, if the user is blocked by the current user
    is_blocked :: Maybe Bool,
    -- | User profile photo; may be null
    photo :: Maybe ChatPhoto.ChatPhoto
  }
  deriving (Eq)

instance Show UserFullInfo where
  show
    UserFullInfo
      { bot_info = bot_info_,
        group_in_common_count = group_in_common_count_,
        premium_gift_options = premium_gift_options_,
        bio = bio_,
        need_phone_number_privacy_exception = need_phone_number_privacy_exception_,
        has_restricted_voice_and_video_note_messages = has_restricted_voice_and_video_note_messages_,
        has_private_forwards = has_private_forwards_,
        has_private_calls = has_private_calls_,
        supports_video_calls = supports_video_calls_,
        can_be_called = can_be_called_,
        is_blocked = is_blocked_,
        photo = photo_
      } =
      "UserFullInfo"
        ++ U.cc
          [ U.p "bot_info" bot_info_,
            U.p "group_in_common_count" group_in_common_count_,
            U.p "premium_gift_options" premium_gift_options_,
            U.p "bio" bio_,
            U.p "need_phone_number_privacy_exception" need_phone_number_privacy_exception_,
            U.p "has_restricted_voice_and_video_note_messages" has_restricted_voice_and_video_note_messages_,
            U.p "has_private_forwards" has_private_forwards_,
            U.p "has_private_calls" has_private_calls_,
            U.p "supports_video_calls" supports_video_calls_,
            U.p "can_be_called" can_be_called_,
            U.p "is_blocked" is_blocked_,
            U.p "photo" photo_
          ]

instance T.FromJSON UserFullInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "userFullInfo" -> parseUserFullInfo v
      _ -> mempty
    where
      parseUserFullInfo :: A.Value -> T.Parser UserFullInfo
      parseUserFullInfo = A.withObject "UserFullInfo" $ \o -> do
        bot_info_ <- o A..:? "bot_info"
        group_in_common_count_ <- o A..:? "group_in_common_count"
        premium_gift_options_ <- o A..:? "premium_gift_options"
        bio_ <- o A..:? "bio"
        need_phone_number_privacy_exception_ <- o A..:? "need_phone_number_privacy_exception"
        has_restricted_voice_and_video_note_messages_ <- o A..:? "has_restricted_voice_and_video_note_messages"
        has_private_forwards_ <- o A..:? "has_private_forwards"
        has_private_calls_ <- o A..:? "has_private_calls"
        supports_video_calls_ <- o A..:? "supports_video_calls"
        can_be_called_ <- o A..:? "can_be_called"
        is_blocked_ <- o A..:? "is_blocked"
        photo_ <- o A..:? "photo"
        return $ UserFullInfo {bot_info = bot_info_, group_in_common_count = group_in_common_count_, premium_gift_options = premium_gift_options_, bio = bio_, need_phone_number_privacy_exception = need_phone_number_privacy_exception_, has_restricted_voice_and_video_note_messages = has_restricted_voice_and_video_note_messages_, has_private_forwards = has_private_forwards_, has_private_calls = has_private_calls_, supports_video_calls = supports_video_calls_, can_be_called = can_be_called_, is_blocked = is_blocked_, photo = photo_}
  parseJSON _ = mempty

instance T.ToJSON UserFullInfo where
  toJSON
    UserFullInfo
      { bot_info = bot_info_,
        group_in_common_count = group_in_common_count_,
        premium_gift_options = premium_gift_options_,
        bio = bio_,
        need_phone_number_privacy_exception = need_phone_number_privacy_exception_,
        has_restricted_voice_and_video_note_messages = has_restricted_voice_and_video_note_messages_,
        has_private_forwards = has_private_forwards_,
        has_private_calls = has_private_calls_,
        supports_video_calls = supports_video_calls_,
        can_be_called = can_be_called_,
        is_blocked = is_blocked_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "userFullInfo",
          "bot_info" A..= bot_info_,
          "group_in_common_count" A..= group_in_common_count_,
          "premium_gift_options" A..= premium_gift_options_,
          "bio" A..= bio_,
          "need_phone_number_privacy_exception" A..= need_phone_number_privacy_exception_,
          "has_restricted_voice_and_video_note_messages" A..= has_restricted_voice_and_video_note_messages_,
          "has_private_forwards" A..= has_private_forwards_,
          "has_private_calls" A..= has_private_calls_,
          "supports_video_calls" A..= supports_video_calls_,
          "can_be_called" A..= can_be_called_,
          "is_blocked" A..= is_blocked_,
          "photo" A..= photo_
        ]
