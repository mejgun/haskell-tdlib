module TD.Query.EditChatSubscriptionInviteLink
  (EditChatSubscriptionInviteLink(..)
  , defaultEditChatSubscriptionInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Edits a subscription invite link for a channel chat. Requires can_invite_users right in the chat for own links and owner privileges for other links. Returns 'TD.Data.ChatInviteLink.ChatInviteLink'
data EditChatSubscriptionInviteLink
  = EditChatSubscriptionInviteLink
    { chat_id     :: Maybe Int    -- ^ Chat identifier
    , invite_link :: Maybe T.Text -- ^ Invite link to be edited
    , name        :: Maybe T.Text -- ^ Invite link name; 0-32 characters
    }
  deriving (Eq, Show)

instance I.ShortShow EditChatSubscriptionInviteLink where
  shortShow
    EditChatSubscriptionInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      , name        = name_
      }
        = "EditChatSubscriptionInviteLink"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "invite_link" `I.p` invite_link_
          , "name"        `I.p` name_
          ]

instance AT.ToJSON EditChatSubscriptionInviteLink where
  toJSON
    EditChatSubscriptionInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      , name        = name_
      }
        = A.object
          [ "@type"       A..= AT.String "editChatSubscriptionInviteLink"
          , "chat_id"     A..= chat_id_
          , "invite_link" A..= invite_link_
          , "name"        A..= name_
          ]

defaultEditChatSubscriptionInviteLink :: EditChatSubscriptionInviteLink
defaultEditChatSubscriptionInviteLink =
  EditChatSubscriptionInviteLink
    { chat_id     = Nothing
    , invite_link = Nothing
    , name        = Nothing
    }

