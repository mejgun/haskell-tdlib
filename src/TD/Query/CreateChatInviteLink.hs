module TD.Query.CreateChatInviteLink
  (CreateChatInviteLink(..)
  , defaultCreateChatInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a new invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat. Returns 'TD.Data.ChatInviteLink.ChatInviteLink'
data CreateChatInviteLink
  = CreateChatInviteLink
    { chat_id              :: Maybe Int    -- ^ Chat identifier
    , name                 :: Maybe T.Text -- ^ Invite link name; 0-32 characters
    , expiration_date      :: Maybe Int    -- ^ Point in time (Unix timestamp) when the link will expire; pass 0 if never
    , member_limit         :: Maybe Int    -- ^ The maximum number of chat members that can join the chat via the link simultaneously; 0-99999; pass 0 if not limited
    , creates_join_request :: Maybe Bool   -- ^ Pass true if users joining the chat via the link need to be approved by chat administrators. In this case, member_limit must be 0
    }
  deriving (Eq, Show)

instance I.ShortShow CreateChatInviteLink where
  shortShow
    CreateChatInviteLink
      { chat_id              = chat_id_
      , name                 = name_
      , expiration_date      = expiration_date_
      , member_limit         = member_limit_
      , creates_join_request = creates_join_request_
      }
        = "CreateChatInviteLink"
          ++ I.cc
          [ "chat_id"              `I.p` chat_id_
          , "name"                 `I.p` name_
          , "expiration_date"      `I.p` expiration_date_
          , "member_limit"         `I.p` member_limit_
          , "creates_join_request" `I.p` creates_join_request_
          ]

instance AT.ToJSON CreateChatInviteLink where
  toJSON
    CreateChatInviteLink
      { chat_id              = chat_id_
      , name                 = name_
      , expiration_date      = expiration_date_
      , member_limit         = member_limit_
      , creates_join_request = creates_join_request_
      }
        = A.object
          [ "@type"                A..= AT.String "createChatInviteLink"
          , "chat_id"              A..= chat_id_
          , "name"                 A..= name_
          , "expiration_date"      A..= expiration_date_
          , "member_limit"         A..= member_limit_
          , "creates_join_request" A..= creates_join_request_
          ]

defaultCreateChatInviteLink :: CreateChatInviteLink
defaultCreateChatInviteLink =
  CreateChatInviteLink
    { chat_id              = Nothing
    , name                 = Nothing
    , expiration_date      = Nothing
    , member_limit         = Nothing
    , creates_join_request = Nothing
    }

