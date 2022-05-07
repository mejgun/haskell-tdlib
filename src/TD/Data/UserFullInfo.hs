{-# LANGUAGE OverloadedStrings #-}

module TD.Data.UserFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotInfo as BotInfo
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified Utils as U

data UserFullInfo = -- | Contains full information about a user
  UserFullInfo
  { -- | For bots, information about the bot; may be null
    bot_info :: Maybe BotInfo.BotInfo,
    -- | Number of group chats where both the other user and the current user are a member; 0 for the current user
    group_in_common_count :: Maybe Int,
    -- | A short user bio
    bio :: Maybe String,
    -- | True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
    need_phone_number_privacy_exception :: Maybe Bool,
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
      { bot_info = bot_info,
        group_in_common_count = group_in_common_count,
        bio = bio,
        need_phone_number_privacy_exception = need_phone_number_privacy_exception,
        has_private_forwards = has_private_forwards,
        has_private_calls = has_private_calls,
        supports_video_calls = supports_video_calls,
        can_be_called = can_be_called,
        is_blocked = is_blocked,
        photo = photo
      } =
      "UserFullInfo"
        ++ U.cc
          [ U.p "bot_info" bot_info,
            U.p "group_in_common_count" group_in_common_count,
            U.p "bio" bio,
            U.p "need_phone_number_privacy_exception" need_phone_number_privacy_exception,
            U.p "has_private_forwards" has_private_forwards,
            U.p "has_private_calls" has_private_calls,
            U.p "supports_video_calls" supports_video_calls,
            U.p "can_be_called" can_be_called,
            U.p "is_blocked" is_blocked,
            U.p "photo" photo
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
        group_in_common_count_ <- mconcat [o A..:? "group_in_common_count", U.rm <$> (o A..: "group_in_common_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        bio_ <- o A..:? "bio"
        need_phone_number_privacy_exception_ <- o A..:? "need_phone_number_privacy_exception"
        has_private_forwards_ <- o A..:? "has_private_forwards"
        has_private_calls_ <- o A..:? "has_private_calls"
        supports_video_calls_ <- o A..:? "supports_video_calls"
        can_be_called_ <- o A..:? "can_be_called"
        is_blocked_ <- o A..:? "is_blocked"
        photo_ <- o A..:? "photo"
        return $ UserFullInfo {bot_info = bot_info_, group_in_common_count = group_in_common_count_, bio = bio_, need_phone_number_privacy_exception = need_phone_number_privacy_exception_, has_private_forwards = has_private_forwards_, has_private_calls = has_private_calls_, supports_video_calls = supports_video_calls_, can_be_called = can_be_called_, is_blocked = is_blocked_, photo = photo_}
  parseJSON _ = mempty

instance T.ToJSON UserFullInfo where
  toJSON
    UserFullInfo
      { bot_info = bot_info,
        group_in_common_count = group_in_common_count,
        bio = bio,
        need_phone_number_privacy_exception = need_phone_number_privacy_exception,
        has_private_forwards = has_private_forwards,
        has_private_calls = has_private_calls,
        supports_video_calls = supports_video_calls,
        can_be_called = can_be_called,
        is_blocked = is_blocked,
        photo = photo
      } =
      A.object
        [ "@type" A..= T.String "userFullInfo",
          "bot_info" A..= bot_info,
          "group_in_common_count" A..= group_in_common_count,
          "bio" A..= bio,
          "need_phone_number_privacy_exception" A..= need_phone_number_privacy_exception,
          "has_private_forwards" A..= has_private_forwards,
          "has_private_calls" A..= has_private_calls,
          "supports_video_calls" A..= supports_video_calls,
          "can_be_called" A..= can_be_called,
          "is_blocked" A..= is_blocked,
          "photo" A..= photo
        ]
