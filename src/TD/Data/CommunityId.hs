module TD.Data.CommunityId
  (CommunityId(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CommunityId
  = CommunityId -- ^ Contains identifier of a community
    { _id :: Maybe Int -- ^ Community identifier
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityId where
  shortShow CommunityId
    { _id = _id_
    }
      = "CommunityId"
        ++ I.cc
        [ "_id" `I.p` _id_
        ]

instance AT.FromJSON CommunityId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityId" -> parseCommunityId v
      _             -> mempty
    
    where
      parseCommunityId :: A.Value -> AT.Parser CommunityId
      parseCommunityId = A.withObject "CommunityId" $ \o -> do
        _id_ <- o A..:?  "id"
        pure $ CommunityId
          { _id = _id_
          }
  parseJSON _ = mempty

