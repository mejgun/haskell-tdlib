module TD.Data.CommunityMemberStatus
  (CommunityMemberStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CommunityAdministratorRights as CommunityAdministratorRights

-- | Provides information about the status of a member in a community
data CommunityMemberStatus
  = CommunityMemberStatusCreator -- ^ The user is the owner of the community and has all the administrator privileges
  | CommunityMemberStatusAdministrator -- ^ The user is a member of the community and has some additional privileges
    { can_be_edited :: Maybe Bool                                                      -- ^ True, if the current user can edit the administrator privileges for the called user
    , rights        :: Maybe CommunityAdministratorRights.CommunityAdministratorRights -- ^ Rights of the administrator
    }
  | CommunityMemberStatusMember -- ^ The user is a member of the community, without any additional privileges or restrictions
  | CommunityMemberStatusLeft -- ^ The user or the chat is not a community member
  | CommunityMemberStatusBanned -- ^ The user or the chat was banned in the community; implies ban in all chats in the community
  deriving (Eq, Show)

instance I.ShortShow CommunityMemberStatus where
  shortShow CommunityMemberStatusCreator
      = "CommunityMemberStatusCreator"
  shortShow CommunityMemberStatusAdministrator
    { can_be_edited = can_be_edited_
    , rights        = rights_
    }
      = "CommunityMemberStatusAdministrator"
        ++ I.cc
        [ "can_be_edited" `I.p` can_be_edited_
        , "rights"        `I.p` rights_
        ]
  shortShow CommunityMemberStatusMember
      = "CommunityMemberStatusMember"
  shortShow CommunityMemberStatusLeft
      = "CommunityMemberStatusLeft"
  shortShow CommunityMemberStatusBanned
      = "CommunityMemberStatusBanned"

instance AT.FromJSON CommunityMemberStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityMemberStatusCreator"       -> pure CommunityMemberStatusCreator
      "communityMemberStatusAdministrator" -> parseCommunityMemberStatusAdministrator v
      "communityMemberStatusMember"        -> pure CommunityMemberStatusMember
      "communityMemberStatusLeft"          -> pure CommunityMemberStatusLeft
      "communityMemberStatusBanned"        -> pure CommunityMemberStatusBanned
      _                                    -> mempty
    
    where
      parseCommunityMemberStatusAdministrator :: A.Value -> AT.Parser CommunityMemberStatus
      parseCommunityMemberStatusAdministrator = A.withObject "CommunityMemberStatusAdministrator" $ \o -> do
        can_be_edited_ <- o A..:?  "can_be_edited"
        rights_        <- o A..:?  "rights"
        pure $ CommunityMemberStatusAdministrator
          { can_be_edited = can_be_edited_
          , rights        = rights_
          }
  parseJSON _ = mempty

