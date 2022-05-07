{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Supergroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified Utils as U

data Supergroup = -- | Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos. Unlike supergroups, channels can have an unlimited number of subscribers
  Supergroup
  { -- | True, if many users reported this supergroup or channel as a fake account
    is_fake :: Maybe Bool,
    -- | True, if many users reported this supergroup or channel as a scam
    is_scam :: Maybe Bool,
    -- | If non-empty, contains a human-readable description of the reason why access to this supergroup or channel must be restricted
    restriction_reason :: Maybe String,
    -- | True, if the supergroup or channel is verified
    is_verified :: Maybe Bool,
    -- | True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on the number of members
    is_broadcast_group :: Maybe Bool,
    -- | True, if the supergroup is a channel
    is_channel :: Maybe Bool,
    -- | True, if the slow mode is enabled in the supergroup
    is_slow_mode_enabled :: Maybe Bool,
    -- | True, if messages sent to the channel need to contain information about the sender. This field is only applicable to channels
    sign_messages :: Maybe Bool,
    -- | True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup
    has_location :: Maybe Bool,
    -- | True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel
    has_linked_chat :: Maybe Bool,
    -- | Number of members in the supergroup or channel; 0 if unknown. Currently, it is guaranteed to be known only if the supergroup or channel was received through searchPublicChats, searchChatsNearby, getInactiveSupergroupChats, getSuitableDiscussionChats, getGroupsInCommon, or getUserPrivacySettingRules
    member_count :: Maybe Int,
    -- | Status of the current user in the supergroup or channel; custom title will be always empty
    status :: Maybe ChatMemberStatus.ChatMemberStatus,
    -- | Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
    date :: Maybe Int,
    -- | Username of the supergroup or channel; empty for private supergroups or channels
    username :: Maybe String,
    -- | Supergroup or channel identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Supergroup where
  show
    Supergroup
      { is_fake = is_fake,
        is_scam = is_scam,
        restriction_reason = restriction_reason,
        is_verified = is_verified,
        is_broadcast_group = is_broadcast_group,
        is_channel = is_channel,
        is_slow_mode_enabled = is_slow_mode_enabled,
        sign_messages = sign_messages,
        has_location = has_location,
        has_linked_chat = has_linked_chat,
        member_count = member_count,
        status = status,
        date = date,
        username = username,
        _id = _id
      } =
      "Supergroup"
        ++ U.cc
          [ U.p "is_fake" is_fake,
            U.p "is_scam" is_scam,
            U.p "restriction_reason" restriction_reason,
            U.p "is_verified" is_verified,
            U.p "is_broadcast_group" is_broadcast_group,
            U.p "is_channel" is_channel,
            U.p "is_slow_mode_enabled" is_slow_mode_enabled,
            U.p "sign_messages" sign_messages,
            U.p "has_location" has_location,
            U.p "has_linked_chat" has_linked_chat,
            U.p "member_count" member_count,
            U.p "status" status,
            U.p "date" date,
            U.p "username" username,
            U.p "_id" _id
          ]

instance T.FromJSON Supergroup where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "supergroup" -> parseSupergroup v
      _ -> mempty
    where
      parseSupergroup :: A.Value -> T.Parser Supergroup
      parseSupergroup = A.withObject "Supergroup" $ \o -> do
        is_fake_ <- o A..:? "is_fake"
        is_scam_ <- o A..:? "is_scam"
        restriction_reason_ <- o A..:? "restriction_reason"
        is_verified_ <- o A..:? "is_verified"
        is_broadcast_group_ <- o A..:? "is_broadcast_group"
        is_channel_ <- o A..:? "is_channel"
        is_slow_mode_enabled_ <- o A..:? "is_slow_mode_enabled"
        sign_messages_ <- o A..:? "sign_messages"
        has_location_ <- o A..:? "has_location"
        has_linked_chat_ <- o A..:? "has_linked_chat"
        member_count_ <- mconcat [o A..:? "member_count", U.rm <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        status_ <- o A..:? "status"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        username_ <- o A..:? "username"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Supergroup {is_fake = is_fake_, is_scam = is_scam_, restriction_reason = restriction_reason_, is_verified = is_verified_, is_broadcast_group = is_broadcast_group_, is_channel = is_channel_, is_slow_mode_enabled = is_slow_mode_enabled_, sign_messages = sign_messages_, has_location = has_location_, has_linked_chat = has_linked_chat_, member_count = member_count_, status = status_, date = date_, username = username_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Supergroup where
  toJSON
    Supergroup
      { is_fake = is_fake,
        is_scam = is_scam,
        restriction_reason = restriction_reason,
        is_verified = is_verified,
        is_broadcast_group = is_broadcast_group,
        is_channel = is_channel,
        is_slow_mode_enabled = is_slow_mode_enabled,
        sign_messages = sign_messages,
        has_location = has_location,
        has_linked_chat = has_linked_chat,
        member_count = member_count,
        status = status,
        date = date,
        username = username,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "supergroup",
          "is_fake" A..= is_fake,
          "is_scam" A..= is_scam,
          "restriction_reason" A..= restriction_reason,
          "is_verified" A..= is_verified,
          "is_broadcast_group" A..= is_broadcast_group,
          "is_channel" A..= is_channel,
          "is_slow_mode_enabled" A..= is_slow_mode_enabled,
          "sign_messages" A..= sign_messages,
          "has_location" A..= has_location,
          "has_linked_chat" A..= has_linked_chat,
          "member_count" A..= member_count,
          "status" A..= status,
          "date" A..= date,
          "username" A..= username,
          "id" A..= _id
        ]
