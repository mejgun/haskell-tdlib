module TD.Query.LoadCommunityFullInfo
  (LoadCommunityFullInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns full information about a community. The data will be sent through update.. Returns 'TD.Data.Ok.Ok'
data LoadCommunityFullInfo
  = LoadCommunityFullInfo
    { community_id :: Maybe Int -- ^ Community identifier
    }
  deriving (Eq, Show)

instance I.ShortShow LoadCommunityFullInfo where
  shortShow
    LoadCommunityFullInfo
      { community_id = community_id_
      }
        = "LoadCommunityFullInfo"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          ]

instance AT.ToJSON LoadCommunityFullInfo where
  toJSON
    LoadCommunityFullInfo
      { community_id = community_id_
      }
        = A.object
          [ "@type"        A..= AT.String "loadCommunityFullInfo"
          , "community_id" A..= community_id_
          ]

