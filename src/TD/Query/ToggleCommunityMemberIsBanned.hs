module TD.Query.ToggleCommunityMemberIsBanned
  (ToggleCommunityMemberIsBanned(..)
  , defaultToggleCommunityMemberIsBanned
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Bans or unbans a member of a community; requires can_ban_members administrator right in the community. A banned member is banned in all chats of the community. Administrators of the community can be banned only by the owner of the community and administrators, which can edit administrator rights of the member. If an owner of a chat in the community is banned, then the chat is removed from the community; in this case, can_edit_chat_list administrator right is also required. Returns 'TD.Data.Ok.Ok'
data ToggleCommunityMemberIsBanned
  = ToggleCommunityMemberIsBanned
    { community_id :: Maybe Int                         -- ^ Identifier of the community
    , member_id    :: Maybe MessageSender.MessageSender -- ^ Identifier of the member to ban or unban
    , is_banned    :: Maybe Bool                        -- ^ Pass true to ban the member; pass false to unban the member
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleCommunityMemberIsBanned where
  shortShow
    ToggleCommunityMemberIsBanned
      { community_id = community_id_
      , member_id    = member_id_
      , is_banned    = is_banned_
      }
        = "ToggleCommunityMemberIsBanned"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "member_id"    `I.p` member_id_
          , "is_banned"    `I.p` is_banned_
          ]

instance AT.ToJSON ToggleCommunityMemberIsBanned where
  toJSON
    ToggleCommunityMemberIsBanned
      { community_id = community_id_
      , member_id    = member_id_
      , is_banned    = is_banned_
      }
        = A.object
          [ "@type"        A..= AT.String "toggleCommunityMemberIsBanned"
          , "community_id" A..= community_id_
          , "member_id"    A..= member_id_
          , "is_banned"    A..= is_banned_
          ]

defaultToggleCommunityMemberIsBanned :: ToggleCommunityMemberIsBanned
defaultToggleCommunityMemberIsBanned =
  ToggleCommunityMemberIsBanned
    { community_id = Nothing
    , member_id    = Nothing
    , is_banned    = Nothing
    }

