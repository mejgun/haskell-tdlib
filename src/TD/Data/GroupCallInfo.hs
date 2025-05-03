module TD.Data.GroupCallInfo
  (GroupCallInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GroupCallInfo
  = GroupCallInfo -- ^ Contains information about a just created or just joined group call
    { group_call_id :: Maybe Int    -- ^ Identifier of the group call
    , join_payload  :: Maybe T.Text -- ^ Join response payload for tgcalls; empty if the call isn't joined
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallInfo where
  shortShow GroupCallInfo
    { group_call_id = group_call_id_
    , join_payload  = join_payload_
    }
      = "GroupCallInfo"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        , "join_payload"  `I.p` join_payload_
        ]

instance AT.FromJSON GroupCallInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallInfo" -> parseGroupCallInfo v
      _               -> mempty
    
    where
      parseGroupCallInfo :: A.Value -> AT.Parser GroupCallInfo
      parseGroupCallInfo = A.withObject "GroupCallInfo" $ \o -> do
        group_call_id_ <- o A..:?  "group_call_id"
        join_payload_  <- o A..:?  "join_payload"
        pure $ GroupCallInfo
          { group_call_id = group_call_id_
          , join_payload  = join_payload_
          }
  parseJSON _ = mempty

