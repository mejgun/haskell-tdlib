module TD.Query.GetSupergroupMembers
  (GetSupergroupMembers(..)
  , defaultGetSupergroupMembers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SupergroupMembersFilter as SupergroupMembersFilter

-- | Returns information about members or banned users in a supergroup or channel. Can be used only if supergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters. Returns 'TD.Data.ChatMembers.ChatMembers'
data GetSupergroupMembers
  = GetSupergroupMembers
    { supergroup_id :: Maybe Int                                             -- ^ Identifier of the supergroup or channel
    , _filter       :: Maybe SupergroupMembersFilter.SupergroupMembersFilter -- ^ The type of users to return; pass null to use supergroupMembersFilterRecent
    , offset        :: Maybe Int                                             -- ^ Number of users to skip
    , limit         :: Maybe Int                                             -- ^ The maximum number of users to be returned; up to 200
    }
  deriving (Eq, Show)

instance I.ShortShow GetSupergroupMembers where
  shortShow
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

defaultGetSupergroupMembers :: GetSupergroupMembers
defaultGetSupergroupMembers =
  GetSupergroupMembers
    { supergroup_id = Nothing
    , _filter       = Nothing
    , offset        = Nothing
    , limit         = Nothing
    }

