module TD.Query.GetCommunityFullInfo
  (GetCommunityFullInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns full information about a community. Returns 'TD.Data.CommunityFullInfo.CommunityFullInfo'
data GetCommunityFullInfo
  = GetCommunityFullInfo
    { community_id :: Maybe Int -- ^ Community identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetCommunityFullInfo where
  shortShow
    GetCommunityFullInfo
      { community_id = community_id_
      }
        = "GetCommunityFullInfo"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          ]

instance AT.ToJSON GetCommunityFullInfo where
  toJSON
    GetCommunityFullInfo
      { community_id = community_id_
      }
        = A.object
          [ "@type"        A..= AT.String "getCommunityFullInfo"
          , "community_id" A..= community_id_
          ]

