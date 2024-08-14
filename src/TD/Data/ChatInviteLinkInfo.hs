module TD.Data.ChatInviteLinkInfo
  (ChatInviteLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InviteLinkChatType as InviteLinkChatType
import qualified Data.Text as T
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.ChatInviteLinkSubscriptionInfo as ChatInviteLinkSubscriptionInfo

data ChatInviteLinkInfo
  = ChatInviteLinkInfo -- ^ Contains information about a chat invite link
    { chat_id              :: Maybe Int                                                           -- ^ Chat identifier of the invite link; 0 if the user has no access to the chat before joining
    , accessible_for       :: Maybe Int                                                           -- ^ If non-zero, the amount of time for which read access to the chat will remain available, in seconds
    , _type                :: Maybe InviteLinkChatType.InviteLinkChatType                         -- ^ Type of the chat
    , title                :: Maybe T.Text                                                        -- ^ Title of the chat
    , photo                :: Maybe ChatPhotoInfo.ChatPhotoInfo                                   -- ^ Chat photo; may be null
    , accent_color_id      :: Maybe Int                                                           -- ^ Identifier of the accent color for chat title and background of chat photo
    , description          :: Maybe T.Text                                                        -- ^ Chat description
    , member_count         :: Maybe Int                                                           -- ^ Number of members in the chat
    , member_user_ids      :: Maybe [Int]                                                         -- ^ User identifiers of some chat members that may be known to the current user
    , subscription_info    :: Maybe ChatInviteLinkSubscriptionInfo.ChatInviteLinkSubscriptionInfo -- ^ Information about subscription plan that must be paid by the user to use the link; may be null if the link doesn't require subscription
    , creates_join_request :: Maybe Bool                                                          -- ^ True, if the link only creates join request
    , is_public            :: Maybe Bool                                                          -- ^ True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
    , is_verified          :: Maybe Bool                                                          -- ^ True, if the chat is verified
    , is_scam              :: Maybe Bool                                                          -- ^ True, if many users reported this chat as a scam
    , is_fake              :: Maybe Bool                                                          -- ^ True, if many users reported this chat as a fake account
    }
  deriving (Eq, Show)

instance I.ShortShow ChatInviteLinkInfo where
  shortShow ChatInviteLinkInfo
    { chat_id              = chat_id_
    , accessible_for       = accessible_for_
    , _type                = _type_
    , title                = title_
    , photo                = photo_
    , accent_color_id      = accent_color_id_
    , description          = description_
    , member_count         = member_count_
    , member_user_ids      = member_user_ids_
    , subscription_info    = subscription_info_
    , creates_join_request = creates_join_request_
    , is_public            = is_public_
    , is_verified          = is_verified_
    , is_scam              = is_scam_
    , is_fake              = is_fake_
    }
      = "ChatInviteLinkInfo"
        ++ I.cc
        [ "chat_id"              `I.p` chat_id_
        , "accessible_for"       `I.p` accessible_for_
        , "_type"                `I.p` _type_
        , "title"                `I.p` title_
        , "photo"                `I.p` photo_
        , "accent_color_id"      `I.p` accent_color_id_
        , "description"          `I.p` description_
        , "member_count"         `I.p` member_count_
        , "member_user_ids"      `I.p` member_user_ids_
        , "subscription_info"    `I.p` subscription_info_
        , "creates_join_request" `I.p` creates_join_request_
        , "is_public"            `I.p` is_public_
        , "is_verified"          `I.p` is_verified_
        , "is_scam"              `I.p` is_scam_
        , "is_fake"              `I.p` is_fake_
        ]

instance AT.FromJSON ChatInviteLinkInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLinkInfo" -> parseChatInviteLinkInfo v
      _                    -> mempty
    
    where
      parseChatInviteLinkInfo :: A.Value -> AT.Parser ChatInviteLinkInfo
      parseChatInviteLinkInfo = A.withObject "ChatInviteLinkInfo" $ \o -> do
        chat_id_              <- o A..:?  "chat_id"
        accessible_for_       <- o A..:?  "accessible_for"
        _type_                <- o A..:?  "type"
        title_                <- o A..:?  "title"
        photo_                <- o A..:?  "photo"
        accent_color_id_      <- o A..:?  "accent_color_id"
        description_          <- o A..:?  "description"
        member_count_         <- o A..:?  "member_count"
        member_user_ids_      <- o A..:?  "member_user_ids"
        subscription_info_    <- o A..:?  "subscription_info"
        creates_join_request_ <- o A..:?  "creates_join_request"
        is_public_            <- o A..:?  "is_public"
        is_verified_          <- o A..:?  "is_verified"
        is_scam_              <- o A..:?  "is_scam"
        is_fake_              <- o A..:?  "is_fake"
        pure $ ChatInviteLinkInfo
          { chat_id              = chat_id_
          , accessible_for       = accessible_for_
          , _type                = _type_
          , title                = title_
          , photo                = photo_
          , accent_color_id      = accent_color_id_
          , description          = description_
          , member_count         = member_count_
          , member_user_ids      = member_user_ids_
          , subscription_info    = subscription_info_
          , creates_join_request = creates_join_request_
          , is_public            = is_public_
          , is_verified          = is_verified_
          , is_scam              = is_scam_
          , is_fake              = is_fake_
          }
  parseJSON _ = mempty

