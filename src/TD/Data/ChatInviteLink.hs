{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatInviteLink = -- | Contains a chat invite link
  ChatInviteLink
  { -- | True, if the link was revoked
    is_revoked :: Maybe Bool,
    -- | True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
    is_primary :: Maybe Bool,
    -- | True, if the link only creates join request. If true, total number of joining members will be unlimited
    creates_join_request :: Maybe Bool,
    -- | Number of pending join requests created using this link
    pending_join_request_count :: Maybe Int,
    -- | Number of chat members, which joined the chat using the link
    member_count :: Maybe Int,
    -- | The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval
    member_limit :: Maybe Int,
    -- | Point in time (Unix timestamp) when the link will expire; 0 if never
    expiration_date :: Maybe Int,
    -- | Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
    edit_date :: Maybe Int,
    -- | Point in time (Unix timestamp) when the link was created
    date :: Maybe Int,
    -- | User identifier of an administrator created the link
    creator_user_id :: Maybe Int,
    -- | Name of the link
    name :: Maybe String,
    -- | Chat invite link
    invite_link :: Maybe String
  }
  deriving (Eq)

instance Show ChatInviteLink where
  show
    ChatInviteLink
      { is_revoked = is_revoked_,
        is_primary = is_primary_,
        creates_join_request = creates_join_request_,
        pending_join_request_count = pending_join_request_count_,
        member_count = member_count_,
        member_limit = member_limit_,
        expiration_date = expiration_date_,
        edit_date = edit_date_,
        date = date_,
        creator_user_id = creator_user_id_,
        name = name_,
        invite_link = invite_link_
      } =
      "ChatInviteLink"
        ++ U.cc
          [ U.p "is_revoked" is_revoked_,
            U.p "is_primary" is_primary_,
            U.p "creates_join_request" creates_join_request_,
            U.p "pending_join_request_count" pending_join_request_count_,
            U.p "member_count" member_count_,
            U.p "member_limit" member_limit_,
            U.p "expiration_date" expiration_date_,
            U.p "edit_date" edit_date_,
            U.p "date" date_,
            U.p "creator_user_id" creator_user_id_,
            U.p "name" name_,
            U.p "invite_link" invite_link_
          ]

instance T.FromJSON ChatInviteLink where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLink" -> parseChatInviteLink v
      _ -> mempty
    where
      parseChatInviteLink :: A.Value -> T.Parser ChatInviteLink
      parseChatInviteLink = A.withObject "ChatInviteLink" $ \o -> do
        is_revoked_ <- o A..:? "is_revoked"
        is_primary_ <- o A..:? "is_primary"
        creates_join_request_ <- o A..:? "creates_join_request"
        pending_join_request_count_ <- o A..:? "pending_join_request_count"
        member_count_ <- o A..:? "member_count"
        member_limit_ <- o A..:? "member_limit"
        expiration_date_ <- o A..:? "expiration_date"
        edit_date_ <- o A..:? "edit_date"
        date_ <- o A..:? "date"
        creator_user_id_ <- o A..:? "creator_user_id"
        name_ <- o A..:? "name"
        invite_link_ <- o A..:? "invite_link"
        return $ ChatInviteLink {is_revoked = is_revoked_, is_primary = is_primary_, creates_join_request = creates_join_request_, pending_join_request_count = pending_join_request_count_, member_count = member_count_, member_limit = member_limit_, expiration_date = expiration_date_, edit_date = edit_date_, date = date_, creator_user_id = creator_user_id_, name = name_, invite_link = invite_link_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLink where
  toJSON
    ChatInviteLink
      { is_revoked = is_revoked_,
        is_primary = is_primary_,
        creates_join_request = creates_join_request_,
        pending_join_request_count = pending_join_request_count_,
        member_count = member_count_,
        member_limit = member_limit_,
        expiration_date = expiration_date_,
        edit_date = edit_date_,
        date = date_,
        creator_user_id = creator_user_id_,
        name = name_,
        invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLink",
          "is_revoked" A..= is_revoked_,
          "is_primary" A..= is_primary_,
          "creates_join_request" A..= creates_join_request_,
          "pending_join_request_count" A..= pending_join_request_count_,
          "member_count" A..= member_count_,
          "member_limit" A..= member_limit_,
          "expiration_date" A..= expiration_date_,
          "edit_date" A..= edit_date_,
          "date" A..= date_,
          "creator_user_id" A..= creator_user_id_,
          "name" A..= name_,
          "invite_link" A..= invite_link_
        ]
