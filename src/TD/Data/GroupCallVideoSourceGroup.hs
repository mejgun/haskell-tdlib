module TD.Data.GroupCallVideoSourceGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GroupCallVideoSourceGroup
  = GroupCallVideoSourceGroup -- ^ Describes a group of video synchronization source identifiers
    { semantics  :: Maybe T.Text -- ^ The semantics of sources, one of "SIM" or "FID"
    , source_ids :: Maybe [Int]  -- ^ The list of synchronization source identifiers
    }
  deriving (Eq)

instance Show GroupCallVideoSourceGroup where
  show GroupCallVideoSourceGroup
    { semantics  = semantics_
    , source_ids = source_ids_
    }
      = "GroupCallVideoSourceGroup"
        ++ I.cc
        [ "semantics"  `I.p` semantics_
        , "source_ids" `I.p` source_ids_
        ]

instance AT.FromJSON GroupCallVideoSourceGroup where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallVideoSourceGroup" -> parseGroupCallVideoSourceGroup v
      _                           -> mempty
    
    where
      parseGroupCallVideoSourceGroup :: A.Value -> AT.Parser GroupCallVideoSourceGroup
      parseGroupCallVideoSourceGroup = A.withObject "GroupCallVideoSourceGroup" $ \o -> do
        semantics_  <- o A..:?  "semantics"
        source_ids_ <- o A..:?  "source_ids"
        pure $ GroupCallVideoSourceGroup
          { semantics  = semantics_
          , source_ids = source_ids_
          }

instance AT.ToJSON GroupCallVideoSourceGroup where
  toJSON GroupCallVideoSourceGroup
    { semantics  = semantics_
    , source_ids = source_ids_
    }
      = A.object
        [ "@type"      A..= AT.String "groupCallVideoSourceGroup"
        , "semantics"  A..= semantics_
        , "source_ids" A..= source_ids_
        ]
