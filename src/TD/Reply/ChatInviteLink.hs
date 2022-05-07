{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { is_revoked = is_revoked,
        is_primary = is_primary,
        creates_join_request = creates_join_request,
        pending_join_request_count = pending_join_request_count,
        member_count = member_count,
        member_limit = member_limit,
        expiration_date = expiration_date,
        edit_date = edit_date,
        date = date,
        creator_user_id = creator_user_id,
        name = name,
        invite_link = invite_link
      } =
      "ChatInviteLink"
        ++ U.cc
          [ U.p "is_revoked" is_revoked,
            U.p "is_primary" is_primary,
            U.p "creates_join_request" creates_join_request,
            U.p "pending_join_request_count" pending_join_request_count,
            U.p "member_count" member_count,
            U.p "member_limit" member_limit,
            U.p "expiration_date" expiration_date,
            U.p "edit_date" edit_date,
            U.p "date" date,
            U.p "creator_user_id" creator_user_id,
            U.p "name" name,
            U.p "invite_link" invite_link
          ]

instance T.FromJSON ChatInviteLink where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLink" -> parseChatInviteLink v
      _ -> fail ""
    where
      parseChatInviteLink :: A.Value -> T.Parser ChatInviteLink
      parseChatInviteLink = A.withObject "ChatInviteLink" $ \o -> do
        is_revoked_ <- o A..:? "is_revoked"
        is_primary_ <- o A..:? "is_primary"
        creates_join_request_ <- o A..:? "creates_join_request"
        pending_join_request_count_ <- mconcat [o A..:? "pending_join_request_count", U.rm <$> (o A..: "pending_join_request_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        member_count_ <- mconcat [o A..:? "member_count", U.rm <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        member_limit_ <- mconcat [o A..:? "member_limit", U.rm <$> (o A..: "member_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
        expiration_date_ <- mconcat [o A..:? "expiration_date", U.rm <$> (o A..: "expiration_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        edit_date_ <- mconcat [o A..:? "edit_date", U.rm <$> (o A..: "edit_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        creator_user_id_ <- mconcat [o A..:? "creator_user_id", U.rm <$> (o A..: "creator_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        name_ <- o A..:? "name"
        invite_link_ <- o A..:? "invite_link"
        return $ ChatInviteLink {is_revoked = is_revoked_, is_primary = is_primary_, creates_join_request = creates_join_request_, pending_join_request_count = pending_join_request_count_, member_count = member_count_, member_limit = member_limit_, expiration_date = expiration_date_, edit_date = edit_date_, date = date_, creator_user_id = creator_user_id_, name = name_, invite_link = invite_link_}
  parseJSON _ = fail ""

instance T.ToJSON ChatInviteLink where
  toJSON
    ChatInviteLink
      { is_revoked = is_revoked,
        is_primary = is_primary,
        creates_join_request = creates_join_request,
        pending_join_request_count = pending_join_request_count,
        member_count = member_count,
        member_limit = member_limit,
        expiration_date = expiration_date,
        edit_date = edit_date,
        date = date,
        creator_user_id = creator_user_id,
        name = name,
        invite_link = invite_link
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLink",
          "is_revoked" A..= is_revoked,
          "is_primary" A..= is_primary,
          "creates_join_request" A..= creates_join_request,
          "pending_join_request_count" A..= pending_join_request_count,
          "member_count" A..= member_count,
          "member_limit" A..= member_limit,
          "expiration_date" A..= expiration_date,
          "edit_date" A..= edit_date,
          "date" A..= date,
          "creator_user_id" A..= creator_user_id,
          "name" A..= name,
          "invite_link" A..= invite_link
        ]
