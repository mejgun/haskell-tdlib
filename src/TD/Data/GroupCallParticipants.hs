module TD.Data.GroupCallParticipants
  (GroupCallParticipants(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data GroupCallParticipants
  = GroupCallParticipants -- ^ Contains identifiers of group call participants
    { total_count     :: Maybe Int                           -- ^ Total number of group call participants
    , participant_ids :: Maybe [MessageSender.MessageSender] -- ^ Identifiers of the participants
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallParticipants where
  shortShow GroupCallParticipants
    { total_count     = total_count_
    , participant_ids = participant_ids_
    }
      = "GroupCallParticipants"
        ++ I.cc
        [ "total_count"     `I.p` total_count_
        , "participant_ids" `I.p` participant_ids_
        ]

instance AT.FromJSON GroupCallParticipants where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallParticipants" -> parseGroupCallParticipants v
      _                       -> mempty
    
    where
      parseGroupCallParticipants :: A.Value -> AT.Parser GroupCallParticipants
      parseGroupCallParticipants = A.withObject "GroupCallParticipants" $ \o -> do
        total_count_     <- o A..:?  "total_count"
        participant_ids_ <- o A..:?  "participant_ids"
        pure $ GroupCallParticipants
          { total_count     = total_count_
          , participant_ids = participant_ids_
          }
  parseJSON _ = mempty

