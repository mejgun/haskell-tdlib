module TD.Query.DeleteCommunity
  (DeleteCommunity(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a community; requires owner privileges. Returns 'TD.Data.Ok.Ok'
data DeleteCommunity
  = DeleteCommunity
    { community_id :: Maybe Int -- ^ Identifier of the community
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteCommunity where
  shortShow
    DeleteCommunity
      { community_id = community_id_
      }
        = "DeleteCommunity"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          ]

instance AT.ToJSON DeleteCommunity where
  toJSON
    DeleteCommunity
      { community_id = community_id_
      }
        = A.object
          [ "@type"        A..= AT.String "deleteCommunity"
          , "community_id" A..= community_id_
          ]

