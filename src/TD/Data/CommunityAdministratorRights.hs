module TD.Data.CommunityAdministratorRights
  (CommunityAdministratorRights(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CommunityAdministratorRights
  = CommunityAdministratorRights -- ^ Describes rights of the administrator in a community
    { can_manage_community :: Maybe Bool -- ^ True, if the user is an administrator. Implied by any other privilege
    , can_change_info      :: Maybe Bool -- ^ True, if the administrator can change the community name, photo, and other settings
    , can_edit_chat_list   :: Maybe Bool -- ^ True, if the user can change the chats added to the community
    , can_promote_members  :: Maybe Bool -- ^ True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
    , can_ban_members      :: Maybe Bool -- ^ True, if the administrator can ban, or unban community members
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityAdministratorRights where
  shortShow CommunityAdministratorRights
    { can_manage_community = can_manage_community_
    , can_change_info      = can_change_info_
    , can_edit_chat_list   = can_edit_chat_list_
    , can_promote_members  = can_promote_members_
    , can_ban_members      = can_ban_members_
    }
      = "CommunityAdministratorRights"
        ++ I.cc
        [ "can_manage_community" `I.p` can_manage_community_
        , "can_change_info"      `I.p` can_change_info_
        , "can_edit_chat_list"   `I.p` can_edit_chat_list_
        , "can_promote_members"  `I.p` can_promote_members_
        , "can_ban_members"      `I.p` can_ban_members_
        ]

instance AT.FromJSON CommunityAdministratorRights where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityAdministratorRights" -> parseCommunityAdministratorRights v
      _                              -> mempty
    
    where
      parseCommunityAdministratorRights :: A.Value -> AT.Parser CommunityAdministratorRights
      parseCommunityAdministratorRights = A.withObject "CommunityAdministratorRights" $ \o -> do
        can_manage_community_ <- o A..:?  "can_manage_community"
        can_change_info_      <- o A..:?  "can_change_info"
        can_edit_chat_list_   <- o A..:?  "can_edit_chat_list"
        can_promote_members_  <- o A..:?  "can_promote_members"
        can_ban_members_      <- o A..:?  "can_ban_members"
        pure $ CommunityAdministratorRights
          { can_manage_community = can_manage_community_
          , can_change_info      = can_change_info_
          , can_edit_chat_list   = can_edit_chat_list_
          , can_promote_members  = can_promote_members_
          , can_ban_members      = can_ban_members_
          }
  parseJSON _ = mempty

