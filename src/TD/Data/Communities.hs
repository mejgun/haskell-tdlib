module TD.Data.Communities
  (Communities(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Communities
  = Communities -- ^ Represents a list of communities
    { community_ids :: Maybe [Int] -- ^ List of community identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow Communities where
  shortShow Communities
    { community_ids = community_ids_
    }
      = "Communities"
        ++ I.cc
        [ "community_ids" `I.p` community_ids_
        ]

instance AT.FromJSON Communities where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communities" -> parseCommunities v
      _             -> mempty
    
    where
      parseCommunities :: A.Value -> AT.Parser Communities
      parseCommunities = A.withObject "Communities" $ \o -> do
        community_ids_ <- o A..:?  "community_ids"
        pure $ Communities
          { community_ids = community_ids_
          }
  parseJSON _ = mempty

