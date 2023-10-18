module TD.Query.GetChatInviteLinks
  (GetChatInviteLinks(..)
  , defaultGetChatInviteLinks
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns invite links for a chat created by specified administrator. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links. Returns 'TD.Data.ChatInviteLinks.ChatInviteLinks'
data GetChatInviteLinks
  = GetChatInviteLinks
    { chat_id            :: Maybe Int    -- ^ Chat identifier
    , creator_user_id    :: Maybe Int    -- ^ User identifier of a chat administrator. Must be an identifier of the current user for non-owner
    , is_revoked         :: Maybe Bool   -- ^ Pass true if revoked links needs to be returned instead of active or expired
    , offset_date        :: Maybe Int    -- ^ Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning
    , offset_invite_link :: Maybe T.Text -- ^ Invite link starting after which to return invite links; use empty string to get results from the beginning
    , limit              :: Maybe Int    -- ^ The maximum number of invite links to return; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatInviteLinks where
  shortShow
    GetChatInviteLinks
      { chat_id            = chat_id_
      , creator_user_id    = creator_user_id_
      , is_revoked         = is_revoked_
      , offset_date        = offset_date_
      , offset_invite_link = offset_invite_link_
      , limit              = limit_
      }
        = "GetChatInviteLinks"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "creator_user_id"    `I.p` creator_user_id_
          , "is_revoked"         `I.p` is_revoked_
          , "offset_date"        `I.p` offset_date_
          , "offset_invite_link" `I.p` offset_invite_link_
          , "limit"              `I.p` limit_
          ]

instance AT.ToJSON GetChatInviteLinks where
  toJSON
    GetChatInviteLinks
      { chat_id            = chat_id_
      , creator_user_id    = creator_user_id_
      , is_revoked         = is_revoked_
      , offset_date        = offset_date_
      , offset_invite_link = offset_invite_link_
      , limit              = limit_
      }
        = A.object
          [ "@type"              A..= AT.String "getChatInviteLinks"
          , "chat_id"            A..= chat_id_
          , "creator_user_id"    A..= creator_user_id_
          , "is_revoked"         A..= is_revoked_
          , "offset_date"        A..= offset_date_
          , "offset_invite_link" A..= offset_invite_link_
          , "limit"              A..= limit_
          ]

defaultGetChatInviteLinks :: GetChatInviteLinks
defaultGetChatInviteLinks =
  GetChatInviteLinks
    { chat_id            = Nothing
    , creator_user_id    = Nothing
    , is_revoked         = Nothing
    , offset_date        = Nothing
    , offset_invite_link = Nothing
    , limit              = Nothing
    }

