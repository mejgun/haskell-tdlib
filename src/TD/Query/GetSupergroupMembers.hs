module TD.Query.GetSupergroupMembers(GetSupergroupMembers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SupergroupMembersFilter as SupergroupMembersFilter

data GetSupergroupMembers -- ^ Returns information about members or banned users in a supergroup or channel. Can be used only if supergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters
  = GetSupergroupMembers
    { supergroup_id :: Maybe Int                                             -- ^ Identifier of the supergroup or channel
    , _filter       :: Maybe SupergroupMembersFilter.SupergroupMembersFilter -- ^ The type of users to return; pass null to use supergroupMembersFilterRecent
    , offset        :: Maybe Int                                             -- ^ Number of users to skip
    , limit         :: Maybe Int                                             -- ^ The maximum number of users be returned; up to 200
    }
  deriving (Eq)

instance Show GetSupergroupMembers where
  show
    GetSupergroupMembers
      { supergroup_id = supergroup_id_
      , _filter       = _filter_
      , offset        = offset_
      , limit         = limit_
      }
        = "GetSupergroupMembers"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "_filter"       `I.p` _filter_
          , "offset"        `I.p` offset_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON GetSupergroupMembers where
  toJSON
    GetSupergroupMembers
      { supergroup_id = supergroup_id_
      , _filter       = _filter_
      , offset        = offset_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "getSupergroupMembers"
          , "supergroup_id" A..= supergroup_id_
          , "filter"        A..= _filter_
          , "offset"        A..= offset_
          , "limit"         A..= limit_
          ]
