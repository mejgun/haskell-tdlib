module TD.Query.GetCommunityMemberChats
  (GetCommunityMemberChats(..)
  , defaultGetCommunityMemberChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Returns chats in a community, which were joined by a member of the community; requires can_ban_members administrator right in the community. Can be used to show chats that will be affected by the member ban. Returns 'TD.Data.CommunityMemberChats.CommunityMemberChats'
data GetCommunityMemberChats
  = GetCommunityMemberChats
    { community_id :: Maybe Int                         -- ^ Identifier of the community
    , member_id    :: Maybe MessageSender.MessageSender -- ^ Identifier of the member
    }
  deriving (Eq, Show)

instance I.ShortShow GetCommunityMemberChats where
  shortShow
    GetCommunityMemberChats
      { community_id = community_id_
      , member_id    = member_id_
      }
        = "GetCommunityMemberChats"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "member_id"    `I.p` member_id_
          ]

instance AT.ToJSON GetCommunityMemberChats where
  toJSON
    GetCommunityMemberChats
      { community_id = community_id_
      , member_id    = member_id_
      }
        = A.object
          [ "@type"        A..= AT.String "getCommunityMemberChats"
          , "community_id" A..= community_id_
          , "member_id"    A..= member_id_
          ]

defaultGetCommunityMemberChats :: GetCommunityMemberChats
defaultGetCommunityMemberChats =
  GetCommunityMemberChats
    { community_id = Nothing
    , member_id    = Nothing
    }

