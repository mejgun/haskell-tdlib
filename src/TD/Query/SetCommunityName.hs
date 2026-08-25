module TD.Query.SetCommunityName
  (SetCommunityName(..)
  , defaultSetCommunityName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes name of the given community; requires can_change_info administrator right in the community. Returns 'TD.Data.Ok.Ok'
data SetCommunityName
  = SetCommunityName
    { community_id :: Maybe Int    -- ^ Identifier of the community
    , name         :: Maybe T.Text -- ^ New name of the community
    }
  deriving (Eq, Show)

instance I.ShortShow SetCommunityName where
  shortShow
    SetCommunityName
      { community_id = community_id_
      , name         = name_
      }
        = "SetCommunityName"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "name"         `I.p` name_
          ]

instance AT.ToJSON SetCommunityName where
  toJSON
    SetCommunityName
      { community_id = community_id_
      , name         = name_
      }
        = A.object
          [ "@type"        A..= AT.String "setCommunityName"
          , "community_id" A..= community_id_
          , "name"         A..= name_
          ]

defaultSetCommunityName :: SetCommunityName
defaultSetCommunityName =
  SetCommunityName
    { community_id = Nothing
    , name         = Nothing
    }

