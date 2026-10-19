module TD.Query.SetCommunityPermissions
  (SetCommunityPermissions(..)
  , defaultSetCommunityPermissions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CommunityPermissions as CommunityPermissions

-- | Changes permissions of regular members in the given community; requires can_ban_members administrator right in the community. Returns 'TD.Data.Ok.Ok'
data SetCommunityPermissions
  = SetCommunityPermissions
    { community_id :: Maybe Int                                       -- ^ Identifier of the community
    , permissions  :: Maybe CommunityPermissions.CommunityPermissions -- ^ New permissions of the community
    }
  deriving (Eq, Show)

instance I.ShortShow SetCommunityPermissions where
  shortShow
    SetCommunityPermissions
      { community_id = community_id_
      , permissions  = permissions_
      }
        = "SetCommunityPermissions"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "permissions"  `I.p` permissions_
          ]

instance AT.ToJSON SetCommunityPermissions where
  toJSON
    SetCommunityPermissions
      { community_id = community_id_
      , permissions  = permissions_
      }
        = A.object
          [ "@type"        A..= AT.String "setCommunityPermissions"
          , "community_id" A..= community_id_
          , "permissions"  A..= permissions_
          ]

defaultSetCommunityPermissions :: SetCommunityPermissions
defaultSetCommunityPermissions =
  SetCommunityPermissions
    { community_id = Nothing
    , permissions  = Nothing
    }

