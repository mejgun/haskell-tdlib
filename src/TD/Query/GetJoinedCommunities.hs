module TD.Query.GetJoinedCommunities
  (GetJoinedCommunities(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of communities joined by the current user. Returns 'TD.Data.Communities.Communities'
data GetJoinedCommunities
  = GetJoinedCommunities
  deriving (Eq, Show)

instance I.ShortShow GetJoinedCommunities where
  shortShow
    GetJoinedCommunities
        = "GetJoinedCommunities"

instance AT.ToJSON GetJoinedCommunities where
  toJSON
    GetJoinedCommunities
        = A.object
          [ "@type" A..= AT.String "getJoinedCommunities"
          ]

