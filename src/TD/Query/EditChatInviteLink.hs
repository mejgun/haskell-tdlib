module TD.Query.EditChatInviteLink
  (EditChatInviteLink(..)
  , defaultEditChatInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Edits a non-primary invite link for a chat. Available for basic groups, supergroups, and channels. If the link creates a subscription, then expiration_date, member_limit and creates_join_request must not be used. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links. Returns 'TD.Data.ChatInviteLink.ChatInviteLink'
data EditChatInviteLink
  = EditChatInviteLink
    { chat_id              :: Maybe Int    -- ^ Chat identifier
    , invite_link          :: Maybe T.Text -- ^ Invite link to be edited
    , name                 :: Maybe T.Text -- ^ Invite link name; 0-32 characters
    , expiration_date      :: Maybe Int    -- ^ Point in time (Unix timestamp) when the link will expire; pass 0 if never
    , member_limit         :: Maybe Int    -- ^ The maximum number of chat members that can join the chat via the link simultaneously; 0-99999; pass 0 if not limited
    , creates_join_request :: Maybe Bool   -- ^ Pass true if users joining the chat via the link need to be approved by chat administrators. In this case, member_limit must be 0
    }
  deriving (Eq, Show)

instance I.ShortShow EditChatInviteLink where
  shortShow
    EditChatInviteLink
      { chat_id              = chat_id_
      , invite_link          = invite_link_
      , name                 = name_
      , expiration_date      = expiration_date_
      , member_limit         = member_limit_
      , creates_join_request = creates_join_request_
      }
        = "EditChatInviteLink"
          ++ I.cc
          [ "chat_id"              `I.p` chat_id_
          , "invite_link"          `I.p` invite_link_
          , "name"                 `I.p` name_
          , "expiration_date"      `I.p` expiration_date_
          , "member_limit"         `I.p` member_limit_
          , "creates_join_request" `I.p` creates_join_request_
          ]

instance AT.ToJSON EditChatInviteLink where
  toJSON
    EditChatInviteLink
      { chat_id              = chat_id_
      , invite_link          = invite_link_
      , name                 = name_
      , expiration_date      = expiration_date_
      , member_limit         = member_limit_
      , creates_join_request = creates_join_request_
      }
        = A.object
          [ "@type"                A..= AT.String "editChatInviteLink"
          , "chat_id"              A..= chat_id_
          , "invite_link"          A..= invite_link_
          , "name"                 A..= name_
          , "expiration_date"      A..= expiration_date_
          , "member_limit"         A..= member_limit_
          , "creates_join_request" A..= creates_join_request_
          ]

defaultEditChatInviteLink :: EditChatInviteLink
defaultEditChatInviteLink =
  EditChatInviteLink
    { chat_id              = Nothing
    , invite_link          = Nothing
    , name                 = Nothing
    , expiration_date      = Nothing
    , member_limit         = Nothing
    , creates_join_request = Nothing
    }

