module TD.Data.GroupCallRecentSpeaker
  (GroupCallRecentSpeaker(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data GroupCallRecentSpeaker
  = GroupCallRecentSpeaker -- ^ Describes a recently speaking participant in a group call
    { participant_id :: Maybe MessageSender.MessageSender -- ^ Group call participant identifier
    , is_speaking    :: Maybe Bool                        -- ^ True, is the user has spoken recently
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallRecentSpeaker where
  shortShow GroupCallRecentSpeaker
    { participant_id = participant_id_
    , is_speaking    = is_speaking_
    }
      = "GroupCallRecentSpeaker"
        ++ I.cc
        [ "participant_id" `I.p` participant_id_
        , "is_speaking"    `I.p` is_speaking_
        ]

instance AT.FromJSON GroupCallRecentSpeaker where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallRecentSpeaker" -> parseGroupCallRecentSpeaker v
      _                        -> mempty
    
    where
      parseGroupCallRecentSpeaker :: A.Value -> AT.Parser GroupCallRecentSpeaker
      parseGroupCallRecentSpeaker = A.withObject "GroupCallRecentSpeaker" $ \o -> do
        participant_id_ <- o A..:?  "participant_id"
        is_speaking_    <- o A..:?  "is_speaking"
        pure $ GroupCallRecentSpeaker
          { participant_id = participant_id_
          , is_speaking    = is_speaking_
          }
  parseJSON _ = mempty

