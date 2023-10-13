module TD.Data.ChatInviteLinkInfo
  (ChatInviteLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatType as ChatType
import qualified Data.Text as T
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo

data ChatInviteLinkInfo
  = ChatInviteLinkInfo -- ^ Contains information about a chat invite link
    { chat_id              :: Maybe Int                         -- ^ Chat identifier of the invite link; 0 if the user has no access to the chat before joining
    , accessible_for       :: Maybe Int                         -- ^ If non-zero, the amount of time for which read access to the chat will remain available, in seconds
    , _type                :: Maybe ChatType.ChatType           -- ^ Type of the chat
    , title                :: Maybe T.Text                      -- ^ Title of the chat
    , photo                :: Maybe ChatPhotoInfo.ChatPhotoInfo -- ^ Chat photo; may be null
    , description          :: Maybe T.Text
    , member_count         :: Maybe Int                         -- ^ Number of members in the chat
    , member_user_ids      :: Maybe [Int]                       -- ^ User identifiers of some chat members that may be known to the current user
    , creates_join_request :: Maybe Bool                        -- ^ True, if the link only creates join request
    , is_public            :: Maybe Bool                        -- ^ True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
    }
  deriving (Eq)

instance Show ChatInviteLinkInfo where
  show ChatInviteLinkInfo
    { chat_id              = chat_id_
    , accessible_for       = accessible_for_
    , _type                = _type_
    , title                = title_
    , photo                = photo_
    , description          = description_
    , member_count         = member_count_
    , member_user_ids      = member_user_ids_
    , creates_join_request = creates_join_request_
    , is_public            = is_public_
    }
      = "ChatInviteLinkInfo"
        ++ I.cc
        [ "chat_id"              `I.p` chat_id_
        , "accessible_for"       `I.p` accessible_for_
        , "_type"                `I.p` _type_
        , "title"                `I.p` title_
        , "photo"                `I.p` photo_
        , "description"          `I.p` description_
        , "member_count"         `I.p` member_count_
        , "member_user_ids"      `I.p` member_user_ids_
        , "creates_join_request" `I.p` creates_join_request_
        , "is_public"            `I.p` is_public_
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
        description_          <- o A..:?  "description"
        member_count_         <- o A..:?  "member_count"
        member_user_ids_      <- o A..:?  "member_user_ids"
        creates_join_request_ <- o A..:?  "creates_join_request"
        is_public_            <- o A..:?  "is_public"
        pure $ ChatInviteLinkInfo
          { chat_id              = chat_id_
          , accessible_for       = accessible_for_
          , _type                = _type_
          , title                = title_
          , photo                = photo_
          , description          = description_
          , member_count         = member_count_
          , member_user_ids      = member_user_ids_
          , creates_join_request = creates_join_request_
          , is_public            = is_public_
          }
  parseJSON _ = mempty

