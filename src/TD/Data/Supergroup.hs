module TD.Data.Supergroup
  (Supergroup(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Usernames as Usernames
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified Data.Text as T

data Supergroup
  = Supergroup -- ^ Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos. Unlike supergroups, channels can have an unlimited number of subscribers
    { _id                       :: Maybe Int                               -- ^ Supergroup or channel identifier
    , usernames                 :: Maybe Usernames.Usernames               -- ^ Usernames of the supergroup or channel; may be null
    , date                      :: Maybe Int                               -- ^ Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
    , status                    :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ Status of the current user in the supergroup or channel; custom title will always be empty
    , member_count              :: Maybe Int                               -- ^ Number of members in the supergroup or channel; 0 if unknown. Currently, it is guaranteed to be known only if the supergroup or channel was received through getChatSimilarChats, getChatsToSendStories, getCreatedPublicChats, getGroupsInCommon, getInactiveSupergroupChats, getRecommendedChats, getSuitableDiscussionChats, getUserPrivacySettingRules, getVideoChatAvailableParticipants, searchPublicChats, or in chatFolderInviteLinkInfo.missing_chat_ids, or in userFullInfo.personal_chat_id, or for chats with messages or stories from publicForwards and foundStories
    , boost_level               :: Maybe Int                               -- ^ Approximate boost level for the chat
    , has_linked_chat           :: Maybe Bool                              -- ^ True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel
    , has_location              :: Maybe Bool                              -- ^ True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup
    , sign_messages             :: Maybe Bool                              -- ^ True, if messages sent to the channel contains name of the sender. This field is only applicable to channels
    , show_message_sender       :: Maybe Bool                              -- ^ True, if messages sent to the channel have information about the sender user. This field is only applicable to channels
    , join_to_send_messages     :: Maybe Bool                              -- ^ True, if users need to join the supergroup before they can send messages. Always true for channels and non-discussion supergroups
    , join_by_request           :: Maybe Bool                              -- ^ True, if all users directly joining the supergroup need to be approved by supergroup administrators. Always false for channels and supergroups without username, location, or a linked chat
    , is_slow_mode_enabled      :: Maybe Bool                              -- ^ True, if the slow mode is enabled in the supergroup
    , is_channel                :: Maybe Bool                              -- ^ True, if the supergroup is a channel
    , is_broadcast_group        :: Maybe Bool                              -- ^ True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on the number of members
    , is_forum                  :: Maybe Bool                              -- ^ True, if the supergroup is a forum with topics
    , is_verified               :: Maybe Bool                              -- ^ True, if the supergroup or channel is verified
    , has_sensitive_content     :: Maybe Bool                              -- ^ True, if content of media messages in the supergroup or channel chat must be hidden with 18+ spoiler
    , restriction_reason        :: Maybe T.Text                            -- ^ If non-empty, contains a human-readable description of the reason why access to this supergroup or channel must be restricted
    , is_scam                   :: Maybe Bool                              -- ^ True, if many users reported this supergroup or channel as a scam
    , is_fake                   :: Maybe Bool                              -- ^ True, if many users reported this supergroup or channel as a fake account
    , has_active_stories        :: Maybe Bool                              -- ^ True, if the supergroup or channel has non-expired stories available to the current user
    , has_unread_active_stories :: Maybe Bool                              -- ^ True, if the supergroup or channel has unread non-expired stories available to the current user
    }
  deriving (Eq, Show)

instance I.ShortShow Supergroup where
  shortShow Supergroup
    { _id                       = _id_
    , usernames                 = usernames_
    , date                      = date_
    , status                    = status_
    , member_count              = member_count_
    , boost_level               = boost_level_
    , has_linked_chat           = has_linked_chat_
    , has_location              = has_location_
    , sign_messages             = sign_messages_
    , show_message_sender       = show_message_sender_
    , join_to_send_messages     = join_to_send_messages_
    , join_by_request           = join_by_request_
    , is_slow_mode_enabled      = is_slow_mode_enabled_
    , is_channel                = is_channel_
    , is_broadcast_group        = is_broadcast_group_
    , is_forum                  = is_forum_
    , is_verified               = is_verified_
    , has_sensitive_content     = has_sensitive_content_
    , restriction_reason        = restriction_reason_
    , is_scam                   = is_scam_
    , is_fake                   = is_fake_
    , has_active_stories        = has_active_stories_
    , has_unread_active_stories = has_unread_active_stories_
    }
      = "Supergroup"
        ++ I.cc
        [ "_id"                       `I.p` _id_
        , "usernames"                 `I.p` usernames_
        , "date"                      `I.p` date_
        , "status"                    `I.p` status_
        , "member_count"              `I.p` member_count_
        , "boost_level"               `I.p` boost_level_
        , "has_linked_chat"           `I.p` has_linked_chat_
        , "has_location"              `I.p` has_location_
        , "sign_messages"             `I.p` sign_messages_
        , "show_message_sender"       `I.p` show_message_sender_
        , "join_to_send_messages"     `I.p` join_to_send_messages_
        , "join_by_request"           `I.p` join_by_request_
        , "is_slow_mode_enabled"      `I.p` is_slow_mode_enabled_
        , "is_channel"                `I.p` is_channel_
        , "is_broadcast_group"        `I.p` is_broadcast_group_
        , "is_forum"                  `I.p` is_forum_
        , "is_verified"               `I.p` is_verified_
        , "has_sensitive_content"     `I.p` has_sensitive_content_
        , "restriction_reason"        `I.p` restriction_reason_
        , "is_scam"                   `I.p` is_scam_
        , "is_fake"                   `I.p` is_fake_
        , "has_active_stories"        `I.p` has_active_stories_
        , "has_unread_active_stories" `I.p` has_unread_active_stories_
        ]

instance AT.FromJSON Supergroup where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "supergroup" -> parseSupergroup v
      _            -> mempty
    
    where
      parseSupergroup :: A.Value -> AT.Parser Supergroup
      parseSupergroup = A.withObject "Supergroup" $ \o -> do
        _id_                       <- o A..:?  "id"
        usernames_                 <- o A..:?  "usernames"
        date_                      <- o A..:?  "date"
        status_                    <- o A..:?  "status"
        member_count_              <- o A..:?  "member_count"
        boost_level_               <- o A..:?  "boost_level"
        has_linked_chat_           <- o A..:?  "has_linked_chat"
        has_location_              <- o A..:?  "has_location"
        sign_messages_             <- o A..:?  "sign_messages"
        show_message_sender_       <- o A..:?  "show_message_sender"
        join_to_send_messages_     <- o A..:?  "join_to_send_messages"
        join_by_request_           <- o A..:?  "join_by_request"
        is_slow_mode_enabled_      <- o A..:?  "is_slow_mode_enabled"
        is_channel_                <- o A..:?  "is_channel"
        is_broadcast_group_        <- o A..:?  "is_broadcast_group"
        is_forum_                  <- o A..:?  "is_forum"
        is_verified_               <- o A..:?  "is_verified"
        has_sensitive_content_     <- o A..:?  "has_sensitive_content"
        restriction_reason_        <- o A..:?  "restriction_reason"
        is_scam_                   <- o A..:?  "is_scam"
        is_fake_                   <- o A..:?  "is_fake"
        has_active_stories_        <- o A..:?  "has_active_stories"
        has_unread_active_stories_ <- o A..:?  "has_unread_active_stories"
        pure $ Supergroup
          { _id                       = _id_
          , usernames                 = usernames_
          , date                      = date_
          , status                    = status_
          , member_count              = member_count_
          , boost_level               = boost_level_
          , has_linked_chat           = has_linked_chat_
          , has_location              = has_location_
          , sign_messages             = sign_messages_
          , show_message_sender       = show_message_sender_
          , join_to_send_messages     = join_to_send_messages_
          , join_by_request           = join_by_request_
          , is_slow_mode_enabled      = is_slow_mode_enabled_
          , is_channel                = is_channel_
          , is_broadcast_group        = is_broadcast_group_
          , is_forum                  = is_forum_
          , is_verified               = is_verified_
          , has_sensitive_content     = has_sensitive_content_
          , restriction_reason        = restriction_reason_
          , is_scam                   = is_scam_
          , is_fake                   = is_fake_
          , has_active_stories        = has_active_stories_
          , has_unread_active_stories = has_unread_active_stories_
          }
  parseJSON _ = mempty

